#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

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

StepSection "Running database setup"
./valet/database.sh

StepSection "Setup Mailpit"
brew install mailpit
brew services start mailpit

# Set common proxy settings
echo "Setting proxy for http://localhost:8025 to mailpit.test"
valet proxy mailpit http://localhost:8025 --secure

StepSection "Running additional setup"
./valet/setup.sh
