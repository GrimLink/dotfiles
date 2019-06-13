#!/bin/bash

# Installs all node Tools
if command -v node &>/dev/null; then
  # Auditing
  npm i -g lighthouse
  # CLI's
  npm i -g grunt-cli
  npm i -g gulp-cli
  npm i -g @vue/cli
  npm i -g np
else
  echo "Skipping.. NODE is not installed"
fi
