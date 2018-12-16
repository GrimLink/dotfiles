#!/bin/bash

# Go to dotfile
cd "$(dirname "${BASH_SOURCE}")";

# Alway check if xcode-select is there
if ! command -v xcode-select &> /dev/null; then
  xcode-select --install
fi

if ! [ "$1" == "--force" -o "$1" == "-f" ]; then
  read -p "Fresh install? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    source macos/.macos;
    source shell/setup.sh;
    source git/setup.sh;
    source homebrew/brew-cask.sh;
    source homebrew/brew.sh;
    source valet/setup.sh;
  else
    git pull origin master;
    source shell/setup.sh;
    source git/setup.sh;
    source vscode/setup.sh;
    source hyper/setup.sh;
  fi;
else
  git pull origin master;
  source shell/setup.sh;
  source git/setup.sh;
  source vscode/setup.sh;
  source hyper/setup.sh;
fi;
