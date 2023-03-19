#!/bin/bash

# Installs all node Tools
if command -v node &>/dev/null; then
  npm config set depth 0
  npm config set init-author-name "$(git config --global --get user.name)"
  npm config set init-license "MIT"
  npm i -g gulp-cli
else
  echo "Skipping config setup.. NODE is not installed"
fi

if command -v nvm &>/dev/null; then
  mkdir ~/.nvm
  touch ~/.nvm/default-packages

  echo gulp-cli >> ~/.nvm/default-packages
  echo np >> ~/.nvm/default-packages

  nvm alias default system
  nvm install --lts
else
  echo "Skipping.. NVM is not installed"
  echo "NVM is not installed"
fi
