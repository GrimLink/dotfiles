#!/bin/bash

if [ ! -d ~/bin ]; then
  mkdir ~/bin
fi

function rsyncBin() {
  rsync \
    --exclude ".DS_Store" \
    --exclude "README.md" \
    --exclude "setup.sh" \
    -avh --no-perms \
    "$(dirname "${BASH_SOURCE}")/." ~/bin;
  # Make all bin files executable
  find ~/bin -type f -iname "*" -exec chmod +x {} \;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    rsyncBin;
  else
    read -p "Update bin files? (y) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      rsyncBin;
    fi;
fi;

unset rsyncBin;
