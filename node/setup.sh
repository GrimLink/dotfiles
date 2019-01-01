#!/bin/bash

# Installs all node Tools
if command -v node &> /dev/null; then
  # Auditing
  npm i -g lighthouse
  # CLI's
  npm i -g grunt-cli
  npm i -g gulp-cli
  npm i -g @vue/cli
  npm i -g np
  # Base config
  npm config set depth 0
  npm config set init-author-name "$(git config --global --get user.name)"
  npm config set init-license "MIT"
else
  echo "NODE is not installed";
  echo "Please first install node to install Node Tools";
fi
