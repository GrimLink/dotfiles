#!/bin/bash

RESET='\033[0m'
BOLD='\033[1m'
ITALIC='\033[3m'
GREEN='\033[1;32m'

# Go to dotfile
cd "$(dirname "${BASH_SOURCE}")"

# Make sure if xcode-select is installed
if xcode-select -p 1>/dev/null; then
  echo -e "${GREEN}xcode-select already installed${RESET}"
else
  echo "${GREEN}Installing xcode-select${RESET}"
  xcode-select --install
  echo "Or download it here https://developer.apple.com/download/more/"
  read -p "When Ready, press any key to continue" -n 1 && echo ""
fi

echo "Make sure the Terminal has Full Disk Access"
echo "In System Preferences > Security & Privacy > Privacy (Tab)"
read -p "When Ready, press any key to continue" -n 1 && echo ""

echo "${GREEN}Setting up Brew${RESET}"
./brew/setup.sh

echo "${GREEN}Setting up mac defaults${RESET}"
./macos/setup.sh

echo "${GREEN}Setting up git & ssh${RESET}"
./git/setup.sh
./git/ssh.sh

echo "${GREEN}Setting up shell${RESET}"
./shell/setup.sh
./zsh/setup.sh

echo "${GREEN}Setting up bin tools${RESET}"
./bin/setup.sh

echo "${GREEN}Setting up Node${RESET}"
./node/setup.sh

echo "${GREEN}Installing apps${RESET}"
./apps/setup.sh
./vscode/setup.sh
./hyper/setup.sh

echo ""
echo "-----"
echo -e "${BOLD}Done${RESET} 🎉"
echo -e "${ITALIC}Some settings require a reboot to take effect, e.g. macos settings${RESET}"
echo "-----"
echo ""



