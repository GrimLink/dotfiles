#!/bin/bash

# Define color codes for output
RESET='\033[0m'
RED='\033[1;31m'
GREEN='\033[1;32m'
BOLD='\033[1m'

# Define helper for running each script
function runAction() {
  echo -e "\n${GREEN}$1${RESET}"

  if ! bash $(dirname "${BASH_SOURCE}")/$2.sh; then
    echo -e "${BOLD}${RED}Error: Failed to configure ${2}${RESET}"
  fi
}

echo -e "\n${GREEN}Installing homebrew (https://brew.sh/)${RESET}"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Add custom bin path if Homebrew is installed in 'opt'
if [[ -d /opt/homebrew ]]; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/bin/brew shellenv)"
fi

runAction "Installing node" node
runAction "Installing php" php
runAction "Installing other dev tools" dev
runAction "Installing apps (browsers, img tools, etc...)" app
