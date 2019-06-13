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
  read -p "Update npm global pkg's. Are you sure? (y) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    source node/pkg.sh
  fi
fi

# Make sure we’re using the latest Homebrew.
brew update
# Upgrade any already-installed formulae.
brew upgrade
# Remove outdated versions from the cellar.
brew cleanup

source vscode/config.sh
source hyper/setup.sh

source .bash_profile
