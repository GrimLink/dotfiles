#!/bin/bash

# Setup file for nvm
# Not sure if I am going to use this

# Probably wil install via curl
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# Create nvm folder
mkdir ~/.nvm

touch ~/.nvm/default-packages
echo gulp-cli >> ~/.nvm/default-packages
echo np >> ~/.nvm/default-packages

if command -v nvm &>/dev/null; then
  # Set default to system node version
  nvm alias default system

  # Install only LTS version
  nvm install --lts
else
  echo "Skipping.. NVM is not installed"
fi
