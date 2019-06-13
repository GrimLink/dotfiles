#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

# Make sure if xcode-select is installed
if xcode-select -p 1>/dev/null; then
  echo -e "${GREEN}xcode-select already installed${RESET}"
else
  echo "Installing xcode-select"
  xcode-select --install
  read -p "When Ready, press any key to continue" -n 1
  echo ""
fi

git clone https://github.com/GrimLink/dotfiles.git dotfiles &&
cd dotfiles

read -p "Run install? (Y/n) " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  source install.sh
fi
