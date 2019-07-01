#!/bin/bash

function rsyncHyperConfig() {
  rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.hyper.js" ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsyncHyperConfig
else
  read -p "Update Hyper config files. Are you sure? [Y/n] " -n 1
  echo ""
  if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    rsyncHyperConfig
  fi
fi

unset rsyncHyperConfig
