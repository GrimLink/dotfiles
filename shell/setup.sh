#!/bin/bash

function rsyncShell() {
  if [ ! -d ~/shell ]; then
    mkdir ~/.shell
  fi

  rsync -avh --no-perms \
    "$(dirname "${BASH_SOURCE}")/aliases" \
    "$(dirname "${BASH_SOURCE}")/exports" \
    "$(dirname "${BASH_SOURCE}")/functions" \
    "$(dirname "${BASH_SOURCE}")/applications" \
    ~/.shell
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsyncShell
else
  read -p "Add shell config files? [Y/n] " -n 1
  echo ""
  if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    rsyncShell
  fi
fi

unset rsyncShell
