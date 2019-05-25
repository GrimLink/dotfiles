#!/bin/bash

# Go to dotfile
cd "$(dirname "${BASH_SOURCE}")"

if ! command -v xcode-select &>/dev/null; then
  xcode-select --install
  echo "Please first install xcode before continuing"
  read -p "Ready? Press any key to continue" -n 1
  echo ""
fi

# If it has the flag `--force` or `-f`.
# Then don't ask for each task

source macos/setup.sh
source shell/setup.sh
source bin/setup.sh

source git/setup.sh
source git/ssh.sh

source node/setup.sh

source brew/brew-cask.sh
source brew/brew.sh

source vscode/extensions.sh
source vscode/config.sh

# Make sure we are using the latest shell env
exec $SHELL -l

source valet-plus/setup.sh
source magerun/setup.sh

# Manual apps to get
cd ~/Downloads
open https://www.fonts.com/web-fonts/google
open https://www.google.com/chrome/beta/
curl -sS -O http://getmiro.com/files/MiroVideoConverter.dmg
