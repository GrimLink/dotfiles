#!/bin/bash

RESET='\033[0m'
BOLD='\033[1m'
ITALIC='\033[3m'
GREEN='\033[1;32m'

# Go to dotfile
cd "$(dirname "${BASH_SOURCE}")"

echo "Welcome to the installer,"
echo "this will run the correct steps for a clean installation of MacOS"

# Make sure if xcode-select is installed
if xcode-select -p 1>/dev/null; then
  echo -e "${GREEN}xcode-select already installed${RESET}"
else
  echo "${GREEN}Installing xcode-select${RESET}"
  xcode-select --install
  echo "Or download it here https://developer.apple.com/download/more/"
  read -p "When Ready, press any key to continue" -n 1 && echo ""
fi

echo "${GREEN}Setting up Mac defaults${RESET}"
./macos/setup.sh

echo "${GREEN}Setting up Brew with some base dev tools${RESET}"
./brew/setup.sh

echo "${GREEN}Setting up Node config and tools${RESET}"
./node/setup.sh

echo "${GREEN}Installing and setting up hyper terminal${RESET}"
./hyper/install.sh
./hyper/setup.sh

echo "${GREEN}Installing up VSCode terminal${RESET}"
./vscode/install.sh

echo "${GREEN}Installing other Apps${RESET}"
./apps/install.sh

echo "A few more things to do:"
echo "1. Make sure the Terminal has Full Disk Access"
echo "   In System Preferences > Security & Privacy > Privacy (Tab)"
echo "2. Make sure the Chrome has Accessibility Access"
echo "   In System Preferences > Security & Privacy > Accessibility (Tab)"

read -p "When Ready, press any key to continue" -n 1 && echo ""

echo ""
echo "-----"
echo -e "${BOLD}Done${RESET} 🎉"
echo -e "${ITALIC}Some settings require a reboot to take effect, e.g. macos settings${RESET}"
echo "-----"
echo ""



