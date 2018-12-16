#!/bin/bash

# Installs all node Tools
if command -v node &> /dev/null; then
  # Auditing
  npm i -g lighthouse
  # CLI's
  npm i -g grunt-cli
  npm i -g gulp-cli
  npm i -g np
  npm config set depth 0
else
  echo -e "NODE is not installed\nPlease first install node to install Node Tools"
fi
