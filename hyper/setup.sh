#!/bin/bash

# TODO check if hyper is installed

function rsyncHyperConfig() {
  rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.hyper.js" ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsyncHyperConfig
else
  read -p "Update Hyper config files. Are you sure? [Y/n] "
  echo ""
  if [[ ! $REPLY =~ ^[nN]|[nN][oO]$ ]]; then
    rsyncHyperConfig
  fi
fi

unset rsyncHyperConfig
