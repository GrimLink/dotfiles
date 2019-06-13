#!/bin/bash
# Setup file nvm on new machine

# Create nvm folder
mkdir ~/.nvm

# Install latest nodejs + the latest LTS
if command -v nvm &>/dev/null; then
  nvm install node
  nvm install --lts
else
  echo "Skipping.. NVM is not installed"
fi
