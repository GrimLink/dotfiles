#!/bin/bash

RESET='\033[0m'
BOLD='\033[1m'
ITALIC='\033[3m'
GREEN='\033[1;32m'

# Go to dotfile
cd "$(dirname "${BASH_SOURCE}")"

echo "Welcome to the Dev Env installer,"
echo "this will run the correct steps for instaling the right tools to run a site locally"

# Make sure if xcode-select is installed
if xcode-select -p 1>/dev/null; then
  echo -e "${GREEN}xcode-select already installed${RESET}"
else
  echo "${GREEN}Installing xcode-select${RESET}"
  xcode-select --install
  echo "Or download it here https://developer.apple.com/download/more/"
  read -p "When Ready, press any key to continue" -n 1 && echo ""
fi

# Make sure the brew setup is there
if command -v brew &>/dev/null; then
  echo "${GREEN}Setting up brew with some base dev tools${RESET}"
  ./brew/setup.sh
fi

echo "${GREEN}Setting up Valet+${RESET}"
./valet/setup.sh

echo "${GREEN}Adding projects folder${RESET}"
mkdir ~/projects
mkdir ~/projects/react
mkdir ~/projects/vue
mkdir ~/projects/magento
mkdir ~/projects/wordpress

echo ""
echo "-----"
echo -e "${BOLD}Done${RESET} 🎉"
echo "-----"
echo ""



