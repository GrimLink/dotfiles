#!/bin/bash

function rsyncVSCodeConfig() {
  rsync -avh --no-perms \
    "$(dirname "${BASH_SOURCE}")/config/settings.json" \
    "$(dirname "${BASH_SOURCE}")/config/keybindings.json" \
    "$(dirname "${BASH_SOURCE}")/config/snippets" \
    $HOME/Library/Application\ Support/Code/User
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsyncVSCodeConfig
else
  read -p "Update VSCode config files. Are you sure? (y) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    rsyncVSCodeConfig
  fi
fi

unset rsyncVSCodeConfig

echo -e "Make sure to reboot vsode\n"
