#!/bin/bash

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsync -avh --no-perms \
    "$(dirname "${BASH_SOURCE}")/.bash_profile" \
    "$(dirname "${BASH_SOURCE}")/.bash_prompt" ~
else
  read -p "Update Bash config files. Are you sure? [Y/n] " -n 1
  echo ""
  if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    rsync -avh --no-perms \
      "$(dirname "${BASH_SOURCE}")/.bash_profile" \
      "$(dirname "${BASH_SOURCE}")/.bash_prompt" ~
  fi
fi
