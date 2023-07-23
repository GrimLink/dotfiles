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
  echo -e "\n${BLUE}$1${RESET}"

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

runAction "Configuring shell.." shell/setup
runAction "Configuring bin.." bin/setup
runAction "Configuring ssh.." git/ssh
runAction "Configuring git.." git/setup
runAction "Installing brew.." brew/install
runAction "Installing zsh.." zsh/setup

echo ""
echo -e "${BOLD}Done${RESET} 🎉"
echo ""
