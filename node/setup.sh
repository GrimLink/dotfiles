#!/bin/bash

# Installs all node Tools
if command -v node &>/dev/null; then
  npm config set depth 0
  npm config set init-author-name "$(git config --global --get user.name)"
  npm config set init-license "MIT"
else
  echo "Skipping Config.. NODE is not installed"
fi

source $(dirname "${BASH_SOURCE}")/nvm.sh
source $(dirname "${BASH_SOURCE}")/pkg.sh
