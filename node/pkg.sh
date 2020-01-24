#!/bin/bash

# Installs all node Tools
if command -v node &>/dev/null; then
  npm i -g gulp-cli
  npm i -g @vue/cli
  npm i -g np
else
  echo "Skipping.. NODE is not installed"
fi
