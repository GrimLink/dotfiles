#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'
RED='\033[0;31m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREW_PREFIX=$(brew --prefix)
SHELL_RC="$HOME/.bashrc"
[ -f "$HOME/.zshrc" ] && SHELL_RC="$HOME/.zshrc"

# Magento 2.4.7 dropped MySQL support and 2.4.8 caps it at 8.4, while MariaDB
# 11.8 (LTS) is supported by both. See the Adobe system requirements:
# https://experienceleague.adobe.com/en/docs/commerce-operations/installation-guide/system-requirements
DB_FORMULA="mariadb@11.8"
DB_BIN="$BREW_PREFIX/opt/$DB_FORMULA/bin"
DB_DATA="$BREW_PREFIX/var/mysql"
DB_CONFIG="$BREW_PREFIX/etc/my.cnf"

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

StepSection "Setup Database ($DB_FORMULA)"

# MariaDB and MySQL claim the same port and data directory,
# so an earlier MySQL install has to be removed first
MYSQL_FORMULAE=$(brew list --formula 2>/dev/null | grep -E '^mysql(@|$)')
if [[ -n "$MYSQL_FORMULAE" ]]; then
  echo -e "${RED}MySQL is still installed!${RESET}"
  echo "To keep the existing databases, run:"
  echo "  $SCRIPT_DIR/database-migrate.sh"
  echo "To throw them away, remove MySQL first:"
  for formula in $MYSQL_FORMULAE; do
    echo "  brew services stop $formula && brew uninstall $formula"
  done
  exit 1
fi

# MariaDB writes its system tables into this folder and gives up when it holds
# data from something else. A folder with 'mysql/user.frm' is one of its own.
if [[ -d "$DB_DATA" && ! -f "$DB_DATA/mysql/user.frm" ]]; then
  echo -e "${RED}The folder '$DB_DATA' holds data that is not from MariaDB!${RESET}"
  echo "Please remove it before continuing:"
  echo "  rm -rf $DB_DATA"
  exit 1
fi

# A MySQL 'my.cnf' holds options MariaDB does not know, such as
# 'mysqlx-bind-address', which makes the setup of the system tables fail
if [[ -f "$DB_CONFIG" ]] && grep -q "mysqlx" "$DB_CONFIG"; then
  echo -e "${RED}'$DB_CONFIG' is a MySQL config!${RESET}"
  echo "Please remove it before continuing:"
  echo "  rm $DB_CONFIG"
  exit 1
fi

# Install MariaDB (keg-only, so it needs to be added to the PATH)
brew install "$DB_FORMULA"

if [[ ! -d "$DB_BIN" ]]; then
  echo -e "${RED}$DB_FORMULA was not installed${RESET}"
  exit 1
fi

# Homebrew leaves an existing config alone, so write one when it is missing
if [[ ! -f "$DB_CONFIG" ]]; then
  echo "Writing '$DB_CONFIG'"
  printf '[mysqld]\n# Only allow connections from localhost\nbind-address = 127.0.0.1\n' > "$DB_CONFIG"
fi

# The system tables are only set up during a first install, and are skipped
# when that install ran into an error
if [[ ! -f "$DB_DATA/mysql/user.frm" ]]; then
  StepSection "Setting up the system tables"
  brew postinstall "$DB_FORMULA" || exit 1
fi

if ! grep -q "$DB_BIN" "$SHELL_RC"; then
  echo "export PATH=\"$DB_BIN:\$PATH\"" >> "$SHELL_RC"
fi

brew services start "$DB_FORMULA"

# 'brew services start' returns before the server accepts connections
echo "Waiting for $DB_FORMULA to accept connections"
for _ in {1..30}; do
  "$DB_BIN/mariadb-admin" --silent ping &> /dev/null && break
  sleep 1
done

# Homebrew initialises MariaDB with socket authentication, which means 'root'
# is only reachable through the macOS account that ran the install. Swapping in
# a password lets Magento connect over TCP as root/root.
StepSection "Setting the root password"
DB_QUERY="ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';FLUSH PRIVILEGES;"
"$DB_BIN/mariadb" -u "$USER" --execute="$DB_QUERY" 2> /dev/null || \
"$DB_BIN/mariadb" -u root --execute="$DB_QUERY" 2> /dev/null || \
"$DB_BIN/mariadb" -u root -proot --execute="SELECT 1" &> /dev/null || \
sudo "$DB_BIN/mariadb" -u root --execute="$DB_QUERY"
