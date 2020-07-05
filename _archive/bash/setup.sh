#!/bin/bash

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsync -avh --no-perms \
    "$(dirname "${BASH_SOURCE}")/.bash_profile" \
    "$(dirname "${BASH_SOURCE}")/.bash_prompt" ~
else
  read -p "Update Bash config files. Are you sure? [Y/n] "
  echo ""
  if [[ ! $REPLY =~ ^[nN]|[nN][oO]$ ]]; then
    rsync -avh --no-perms \
      "$(dirname "${BASH_SOURCE}")/.bash_profile" \
      "$(dirname "${BASH_SOURCE}")/.bash_prompt" ~
  fi
fi
