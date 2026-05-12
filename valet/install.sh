#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'
RED='\033[0;31m'

BREW_PREFIX=$(brew --prefix)
SHELL_RC="$HOME/.bashrc"
[ -f "$HOME/.zshrc" ] && SHELL_RC="$HOME/.zshrc"

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

echo "This script will folow you through the steps needed to setup Larvavel valet 4"

# Make sure both brew, php and composer are installed
StepSection "Checking if all preparations are set"

if ! command -v php &> /dev/null; then
  echo "php not installed"
  exit 1;
else
  echo "✅ php"
fi

if ! command -v composer &> /dev/null; then
  echo "composer not installed"
  exit 1;
else
  echo "✅ composer"
fi

# Install step
StepSection "Installing valet"
composer global require laravel/valet
valet install

# Random test url, can be anything ending with .test
StepSection "Testing ping from valet"
ping -c1 localhost.test

StepSection "Setting sudo mode for Brew and Valet"
valet trust

# https://github.com/laravel/valet/discussions/1127#discussioncomment-1748638
# https://nodejs.org/api/cli.html#node_extra_ca_certsfile
echo 'export NODE_EXTRA_CA_CERTS="$HOME/.config/valet/CA/LaravelValetCASelfSigned.pem"' >> "$SHELL_RC"

StepSection "Setup Database"
# Check if '/opt/homebrew/var/mysql' excits,
# may trow installations errors if present
if [[ -d "$BREW_PREFIX/var/mysql" ]]; then
  echo -e "${RED}The folder '$BREW_PREFIX/var/mysql' is found!${RESET}"
  echo "Please remove this folder before continuing."
  read -rsn1 -p "When ready, press any key to continue"
  echo ""
fi

# Install Mysql v8.4 (LTS)
brew install mysql@8.4 && \
echo "export PATH=\"$BREW_PREFIX/opt/mysql@8.4/bin:\$PATH\"" >> "$SHELL_RC" && \
brew services start mysql@8.4 && \
$BREW_PREFIX/opt/mysql@8.4/bin/mysql -u root --execute="ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';FLUSH PRIVILEGES;"

StepSection "Setup Mailpit"
brew install mailpit
brew services start mailpit

# Set common proxy settings
echo "Setting proxy for http://localhost:8025 to mailpit.test"
valet proxy mailpit http://localhost:8025 --secure

StepSection "Running additional setup"
./valet/setup.sh
