#!/bin/bash

# Purely for getting the dotfiles
if ! command -v xcode-select &>/dev/null; then
  xcode-select --install
  echo "Please first install xcode before continuing"
  read -rsn1 -p "When ready, press any key to continue"
  echo ""
fi

git clone https://github.com/GrimLink/dotfiles.git dotfiles &&
  cd dotfiles

read -p "Run install? (y) " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  source install.sh
fi
