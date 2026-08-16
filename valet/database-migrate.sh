#!/bin/bash

set -o pipefail

RESET='\033[0m'
GREEN='\033[1;32m'
RED='\033[0;31m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREW_PREFIX=$(brew --prefix)
SHELL_RC="$HOME/.bashrc"
[ -f "$HOME/.zshrc" ] && SHELL_RC="$HOME/.zshrc"

DB_DATA="$BREW_PREFIX/var/mysql"
DB_CONFIG="$BREW_PREFIX/etc/my.cnf"

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

function DumpAndRemoveMySQL() {
  StepSection "Looking for an existing MySQL install"

  local MYSQL_FORMULAE
  MYSQL_FORMULAE=$(brew list --formula 2>/dev/null | grep -E '^mysql(@|$)')
  if [[ -z "$MYSQL_FORMULAE" ]]; then
    echo "No MySQL install found, there is nothing to migrate."
    echo "Run '$SCRIPT_DIR/database.sh' to install MariaDB."
    exit 0
  fi

  if [[ $(echo "$MYSQL_FORMULAE" | wc -l | tr -d ' ') -gt 1 ]]; then
    echo -e "${RED}More than one MySQL install was found:${RESET}"
    echo "$MYSQL_FORMULAE"
    echo "Please remove the ones you no longer need and run this script again."
    exit 1
  fi

  local MYSQL_FORMULA MYSQL_BIN
  MYSQL_FORMULA="$MYSQL_FORMULAE"
  MYSQL_BIN="$(brew --prefix "$MYSQL_FORMULA")/bin"
  echo "Found $MYSQL_FORMULA"

  StepSection "This will replace $MYSQL_FORMULA with MariaDB"
  echo "1. Dump every database to '$BACKUP_DIR'"
  echo "2. Stop and uninstall $MYSQL_FORMULA"
  echo "3. Delete the data directory '$DB_DATA'"
  echo "4. Install MariaDB through 'database.sh'"
  echo "5. Import the dumps into MariaDB"
  echo ""
  echo -e "${RED}Steps 2 and 3 cannot be undone.${RESET}"
  read -r -p "Type 'migrate' to continue: " CONFIRM
  if [[ "$CONFIRM" != "migrate" ]]; then
    echo "Aborted, nothing was changed."
    exit 1
  fi

  StepSection "Connecting to $MYSQL_FORMULA"

  # The server has to be up to dump anything, and it may have just been started
  brew services start "$MYSQL_FORMULA" > /dev/null

  # A wrong password still counts as a reachable server
  function MySQLAlive() {
    local response
    response=$("$MYSQL_BIN/mysqladmin" -u root --connect-timeout=2 ping 2>&1)
    [[ "$response" == *"alive"* || "$response" == *"Access denied"* ]]
  }

  function MySQLConnect() {
    "$MYSQL_BIN/mysql" -u root "$@" --execute="SELECT 1" &> /dev/null
  }

  for _ in {1..30}; do
    MySQLAlive && break
    sleep 1
  done

  # './database.sh' sets the root password to 'root', but older setups
  # may still have an empty password
  MYSQL_ARGS=()
  if MySQLConnect -proot; then
    MYSQL_ARGS=("-proot")
  elif ! MySQLConnect; then
    read -rsp "Password for the MySQL 'root' user: " MYSQL_PASSWORD
    echo ""
    MYSQL_ARGS=("-p$MYSQL_PASSWORD")
    if ! MySQLConnect "${MYSQL_ARGS[@]}"; then
      echo -e "${RED}Could not connect to $MYSQL_FORMULA${RESET}"
      exit 1
    fi
  fi

  StepSection "Dumping databases to $BACKUP_DIR"
  mkdir -p "$BACKUP_DIR"

  local DATABASES
  DATABASES=$("$MYSQL_BIN/mysql" -u root "${MYSQL_ARGS[@]}" --skip-column-names --batch \
    --execute="SHOW DATABASES" | grep -Ev '^(information_schema|performance_schema|mysql|sys)$')

  if [[ -z "$DATABASES" ]]; then
    echo "No databases found besides the system ones."
  fi

  for database in $DATABASES; do
    echo "Dumping '$database'"
    # MySQL 8 defaults to the utf8mb4_0900 collations, which MariaDB does not know
    if ! "$MYSQL_BIN/mysqldump" -u root "${MYSQL_ARGS[@]}" \
      --databases "$database" \
      --single-transaction \
      --no-tablespaces \
      --routines \
      --events \
      --triggers | sed 's/utf8mb4_0900_[a-z_]*/utf8mb4_general_ci/g' > "$BACKUP_DIR/$database.sql"
    then
      echo -e "${RED}Failed to dump '$database', stopping before anything is removed.${RESET}"
      echo "The dumps made so far are in '$BACKUP_DIR'."
      exit 1
    fi
  done

  StepSection "Removing $MYSQL_FORMULA"
  brew services stop "$MYSQL_FORMULA"

  # 'brew services stop' returns before the server has flushed everything to
  # disk, and a server that is still writing keeps recreating the files that
  # the removal of the data directory is trying to delete
  echo "Waiting for the server to shut down"
  for _ in {1..60}; do
    pgrep -x mysqld > /dev/null || break
    sleep 1
  done

  # A server that was not started through 'brew services' survives the stop
  # above and keeps running with its data directory deleted underneath it
  if pgrep -x mysqld > /dev/null; then
    echo "The server is still running, asking it to stop"
    pkill -x mysqld
    for _ in {1..30}; do
      pgrep -x mysqld > /dev/null || break
      sleep 1
    done
  fi

  if pgrep -x mysqld > /dev/null; then
    echo -e "${RED}A MySQL server is still running:${RESET}"
    pgrep -lx mysqld
    echo "Stop it by hand, then run this script again."
    echo "The dumps are already saved in '$BACKUP_DIR'."
    exit 1
  fi

  if ! brew uninstall "$MYSQL_FORMULA"; then
    echo -e "${RED}Could not uninstall $MYSQL_FORMULA${RESET}"
    echo "The dumps are safe in '$BACKUP_DIR', resolve the error and run this script again."
    exit 1
  fi

}

# Clears out what MySQL, or an install that did not finish, leaves behind.
# Runs on both paths, since a resume has the same mess to clean up.
function PrepareForMariaDB() {
  StepSection "Clearing out what MySQL left behind"

  # A MySQL 'my.cnf' holds options MariaDB does not know, such as
  # 'mysqlx-bind-address', which makes the setup of its system tables fail
  if [[ -f "$DB_CONFIG" ]] && grep -q "mysqlx" "$DB_CONFIG"; then
    echo "Moving the MySQL config to '$BACKUP_DIR/my.cnf'"
    mv "$DB_CONFIG" "$BACKUP_DIR/my.cnf"
  fi

  # MariaDB reuses this folder and refuses to set up its system tables when it
  # holds data from something else. A folder with 'mysql/user.frm' is one of
  # its own and is left alone, so a working MariaDB is never thrown away.
  if [[ -n "$BREW_PREFIX" && -d "$DB_DATA" && ! -f "$DB_DATA/mysql/user.frm" ]]; then
    echo "Deleting '$DB_DATA'"
    rm -rf "$DB_DATA"

    # A server that is still shutting down can recreate files while they are
    # being deleted, so it gets a second try before giving up
    if [[ -d "$DB_DATA" ]]; then
      sleep 5
      rm -rf "$DB_DATA"
    fi

    if [[ -d "$DB_DATA" ]]; then
      echo -e "${RED}Could not delete '$DB_DATA'${RESET}"
      echo "Remove it by hand, then run:"
      echo "  $SCRIPT_DIR/database-migrate.sh $BACKUP_DIR"
      exit 1
    fi
  fi

  # Drop the PATH export the old MySQL install left behind
  if grep -q "opt/mysql@" "$SHELL_RC"; then
    echo "Removing the MySQL PATH export from '$SHELL_RC' (kept as '$SHELL_RC.bak')"
    sed -i '.bak' '/opt\/mysql@/d' "$SHELL_RC"
  fi
}

# An earlier run can be picked up again with './database-migrate.sh <folder>',
# which skips straight to installing MariaDB and importing the dumps
BACKUP_DIR="$1"
if [[ -n "$BACKUP_DIR" ]]; then
  if [[ ! -d "$BACKUP_DIR" ]]; then
    echo -e "${RED}'$BACKUP_DIR' does not exist${RESET}"
    exit 1
  fi
  StepSection "Resuming with the dumps in $BACKUP_DIR"
else
  BACKUP_DIR="$HOME/valet-database-backup-$(date +%Y%m%d-%H%M%S)"
  DumpAndRemoveMySQL
fi

PrepareForMariaDB

StepSection "Installing MariaDB"
if ! "$SCRIPT_DIR/database.sh"; then
  echo -e "${RED}MariaDB was not installed${RESET}"
  echo "Fix the error above, then run:"
  echo "  $SCRIPT_DIR/database-migrate.sh $BACKUP_DIR"
  exit 1
fi

StepSection "Importing the dumps into MariaDB"

MARIADB_FORMULA=$(brew list --formula 2>/dev/null | grep -E '^mariadb(@|$)' | head -1)
if [[ -z "$MARIADB_FORMULA" ]]; then
  echo -e "${RED}No MariaDB install was found${RESET}"
  echo "The dumps are safe in '$BACKUP_DIR' and can be imported by hand."
  exit 1
fi

MARIADB_BIN="$(brew --prefix "$MARIADB_FORMULA")/bin"

FAILED=()
for dump in "$BACKUP_DIR"/*.sql; do
  [ -e "$dump" ] || continue
  echo "Importing '$(basename "$dump")'"
  if ! "$MARIADB_BIN/mariadb" -u root -proot < "$dump"; then
    FAILED+=("$(basename "$dump")")
  fi
done

if [[ ${#FAILED[@]} -gt 0 ]]; then
  echo -e "${RED}These dumps did not import cleanly:${RESET}"
  printf '  %s\n' "${FAILED[@]}"
  echo "They are still in '$BACKUP_DIR'."
  exit 1
fi

StepSection "Done"
echo "MariaDB runs as $MARIADB_FORMULA on port 3306 as root/root,"
echo "so 'app/etc/env.php' does not need to change."
echo "Run 'bin/magento setup:upgrade' and 'bin/magento cache:flush' per project."
echo "Remove '$BACKUP_DIR' once everything works."
