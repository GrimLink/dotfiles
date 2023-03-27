#!/bin/bash

DEFAULT_NAME=$(git config --global --get user.name);

brew install node
brew install pnpm

# Setup default config
if [[ -z "$DEFAULT_NAME" ]]; then
  read -p "Author: " NAME && echo ""
else
  NAME=$DEFAULT_NAME
fi

npm config set depth 0
npm config set init-author-name "${NAME}"
npm config set init-license "MIT"
