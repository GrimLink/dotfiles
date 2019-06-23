#!/bin/bash

if command -v zsh &>/dev/null; then
  # Get Zsh, if not installed
  brew install zsh

  # And set zsh as default $SHELL (may require a reboot)
  chsh -s /bin/zsh
fi

# Get theme
npm list -g | grep pure-prompt || npm i -g pure-prompt

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.zshrc" ~
else
  read -p "Update Zsh config files. Are you sure? (Y/n) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.zshrc" ~
  fi
fi
