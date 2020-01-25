#!/bin/bash

# Installs all node Tools
if command -v node &>/dev/null; then
  # Auditing (using npx instead)
  npm i -g lighthouse
  npm i -g hint
  # Compilers/Bundlers
  npm i -g gulp-cli
  npm i -g @vue/cli
  npm i -g @gridsome/cli
  npm i -g gatsby-cli
  # Node Tools
  npm i -g np
else
  echo "Skipping.. NODE is not installed"
fi
