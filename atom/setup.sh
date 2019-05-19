#!/bin/bash

# Install all extensions
if command -v apm &>/dev/null; then
  apm stars --user GrimLink --install
else
  echo "apm cli missing"
fi

function rsyncAtomConfig() {
  rsync -avh --no-perms \
    "$(dirname "${BASH_SOURCE}")/config/config.cson" \
    "$(dirname "${BASH_SOURCE}")/config/keymap.cson" \
    "$(dirname "${BASH_SOURCE}")/config/snippets.cson" \
    "$(dirname "${BASH_SOURCE}")/config/styles.less" \
    $HOME/.atom
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsyncAtomConfig
else
  read -p "Update Atom config files. Are you sure? (y) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    rsyncAtomConfig
  fi
fi

unset rsyncAtomConfig

echo -e "Make sure to reboot Atom\n"
