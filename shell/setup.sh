#!/bin/bash

function rsyncBash() {
  rsync -avh --no-perms \
  "$(dirname "${BASH_SOURCE}")/.bash_profile" \
  "$(dirname "${BASH_SOURCE}")/.bash_prompt" \
  ~;

  if [ ! -d ~/shell ]; then
    mkdir ~/.shell
  fi

  rsync -avh --no-perms \
  "$(dirname "${BASH_SOURCE}")/aliases" \
  "$(dirname "${BASH_SOURCE}")/exports" \
  "$(dirname "${BASH_SOURCE}")/functions" \
  "$(dirname "${BASH_SOURCE}")/magento" \
  ~/.shell;

  # Load new bash options
  source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    rsyncBash;
  else
    read -p "Update Bash files? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      rsyncBash;
    fi;
fi;
