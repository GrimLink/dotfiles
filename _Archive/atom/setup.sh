#!/bin/bash

# Install all extensions
if command -v apm &>/dev/null; then
  apm stars --user GrimLink --install
else
  echo "apm cli missing"
fi

rsync -avh --no-perms \
  "$(dirname "${BASH_SOURCE}")/config/config.cson" \
  "$(dirname "${BASH_SOURCE}")/config/keymap.cson" \
  "$(dirname "${BASH_SOURCE}")/config/snippets.cson" \
  "$(dirname "${BASH_SOURCE}")/config/styles.less" \
  $HOME/.atom

echo -e "Make sure to reboot Atom\n"
