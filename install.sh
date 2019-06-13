#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

# Go to dotfile
cd "$(dirname "${BASH_SOURCE}")"

# Make sure if xcode-select is installed
if xcode-select -p 1>/dev/null; then
 echo -e "${GREEN}xcode-select already installed${RESET}"
else
  echo "Installing xcode-select"
  xcode-select --install
  read -p "When Ready, press any key to continue" -n 1
  echo ""
fi

# If it has the flag `--force` or `-f`.
# Then don't ask for each task

echo "Setting up mac defaults"
source macos/setup.sh

echo "Setting up shell"
read -p "Use zsh as shell? (Y/n) " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  source zsh/setup.sh
else
  source bash/setup.sh
fi
source shell/setup.sh

echo "Setting up Brew"
source brew/brew.sh

echo "Setting up Node"
source node/setup.sh

echo "Setting up git & ssh"
source git/setup.sh
source git/ssh.sh

echo "Setting up valet+"
source valet-plus/setup.sh

echo "Setting up bin tools"
source bin/setup.sh
source magerun/setup.sh

# Make sure we are using the latest shell env
exec $SHELL -l

echo "Installing apps"
source brew/app.sh
source vscode/extensions.sh
source vscode/config.sh

# Manual apps to get
# TODO: add last steps doc
cd ~/Downloads
open https://www.fonts.com/web-fonts/google
open https://www.google.com/chrome/beta/
curl -sS -O https://dl.google.com/dl/androidjumper/mtp/current/AndroidFileTransfer.dmg
curl -sS -O http://getmiro.com/files/MiroVideoConverter.dmg



