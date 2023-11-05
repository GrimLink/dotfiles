#!/bin/bash

# Define color codes for output
RESET='\033[0m'
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
BOLD='\033[1m'
ITALIC='\033[3m'

# Define helper for running each script
function runAction() {
  echo -e "\n${GREEN}$1${RESET}"

  if ! bash $(dirname "${BASH_SOURCE}")/$2.sh; then
    echo -e "${BOLD}${RED}Error: Failed to configure ${2}${RESET}"
  fi
}

if ! xcode-select -p 1>/dev/null; then
  echo "Installing xcode-select"
  xcode-select --install
  echo "Or download it here https://developer.apple.com/download/more/"
  read -p "When Ready, press any key to continue" -n 1 && echo ""
fi

echo -e "\n${GREEN}Installing homebrew (https://brew.sh/)${RESET}"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Add custom bin path if Homebrrew is installed in 'opt'
if [[ -d /opt/homebrew ]]; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/bin/brew shellenv)"
fi

runAction "Installing node" node
runAction "Installing php" php
runAction "Installing db" db
runAction "Installing other dev tools" dev
runAction "Installing code editors" editor
runAction "Installing apps (browsers, img tools, etc...)" app
