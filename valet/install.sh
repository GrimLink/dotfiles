#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'
RED='\033[0;31m'

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

# Make sure composer is compatible with Magento 2.4.6
composer self-update --2.2

# Install step
StepSection "Installing valet"
composer global require laravel/valet
valet install

# Random test url, can be anything ending with .test
StepSection "Testing ping from valet"
ping -c1 localhost.test

StepSection "Setting sudo mode for Brew and Valet"
valet trust

StepSection "Setup Database"

# Check if '/opt/homebrew/var/mysql' excits,
# may trow installations errors if present
if [[ -d "/opt/homebrew/var/mysql" ]]; then
  echo -e "${RED}The folder '/opt/homebrew/var/mysql' is found!${RESET}"
  echo "Please remove this folder before continuing."
  read -rsn1 -p "When ready, press any key to continue"
  echo ""
fi

brew install mysql@8.0 && \
brew services start mysql@8.0 && \
mysql -u root --execute="ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';FLUSH PRIVILEGES;"

