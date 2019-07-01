#!/bin/bash

RESET='\033[0m'
BOLD='\033[1m'
ITALIC='\033[3m'
GREEN='\033[1;32m'

# Go to dotfile
cd "$(dirname "${BASH_SOURCE}")"

git pull origin master

# If it has the flag `--force` or `-f`.
# Then don't ask for each task

echo -e "\n${GREEN}Syncing shell config${RESET}"
source shell/setup.sh
source bin/setup.sh

echo -e "\n${GREEN}Syncing git config${RESET}"
source git/setup.sh

echo -e "\n${GREEN}Syncing editor config${RESET}"
source vscode/config.sh
source hyper/setup.sh

echo -e "\n${GREEN}Starting updater..${RESET}"
if [ "$1" == "--force" -o "$1" == "-f" ]; then
  echo -e "${GREEN}Updating node pkg's${RESET}"
  source node/pkg.sh
else
  read -p "Update npm global pkg's. Are you sure? [N/y] " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${GREEN}Updating node pkg's${RESET}"
    source node/pkg.sh
  fi
fi

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  brew update # Make sure we’re using the latest Homebrew.
  brew upgrade # Upgrade any already-installed formulae.
  brew cleanup # Remove outdated versions from the cellar.
else
  read -p "Update brew pkg's. Are you sure? [N/y] " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew update # Make sure we’re using the latest Homebrew.
    brew upgrade # Upgrade any already-installed formulae.
    brew cleanup # Remove outdated versions from the cellar.
  fi
fi

# Reload Shell
exec $SHELL -l
