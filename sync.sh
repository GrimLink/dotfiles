#!/bin/bash

# Go to dotfile
cd "$(dirname "${BASH_SOURCE}")"

git pull origin master

# If it has the flag `--force` or `-f`.
# Then don't ask for each task
source shell/setup.sh
source bin/setup.sh

source git/setup.sh

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  source node/pkg.sh
else
  read -p "Update npm global pkg's. Are you sure? [N/y] " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
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

source vscode/config.sh
source hyper/setup.sh

# Reload Shell
exec $SHELL -l
