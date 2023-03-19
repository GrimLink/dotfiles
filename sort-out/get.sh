#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

# Make sure if xcode-select is installed
if xcode-select -p 1>/dev/null; then
  echo -e "${GREEN}xcode-select already installed${RESET}"
else
  echo "${GREEN}Installing xcode-select${RESET}"
  xcode-select --install
  echo "Or download it here https://developer.apple.com/download/more/"
  read -p "When Ready, press any key to continue" -n 1 && echo ""
fi

read -p "Install dotfiles in (${HOME}/dotfiles) or " TARGET;
echo "";
if [[ -z "$TARGET" ]]; then TARGET="${HOME}/dotfiles"; fi
git clone https://github.com/GrimLink/dotfiles.git $TARGET &&
cd $TARGET

read -p "Run install? [y/N] "
echo ""
if [[ $REPLY =~ ^[yY]|[yY][eE][sS]$ ]]; then
  ./install.sh
fi
