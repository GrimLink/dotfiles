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

runAction "Configuring mac.." macos/install
runAction "Configuring bin.." bin/setup
runAction "Configuring shell.." shell/setup

runAction "Installing brew.." brew/install

runAction "Configuring git.." git/setup
runAction "Configuring ssh.." git/ssh
runAction "Installing git tools.." git/install

runAction "Installing node.." node/install
runAction "Installing php.." php/install
runAction "Installing rust.." rust/install

runAction "Installing zsh.." zsh/install
runAction "Configuring zsh.." zsh/setup

runAction "Installing Ghostty.." ghostty/install

runAction "Installing Zed.." zed/install

runAction "Installing Claude.." claude/install
runAction "Configuring Claude.." claude/setup

runAction "Installing Gemini.." gemini/install
runAction "Configuring Gemini.." gemini/setup

runAction "Installing Skills.." skills/setup

echo ""
echo -e "${BOLD}Done${RESET} 🎉"
echo ""
