#!/bin/bash

# Get and install
if ! command -v brew &>/dev/null; then
  brew tap henkrehorst/php
  brew install valet-php@7.2 # For valet install
  brew install valet-php@7.3
  brew install valet-php@7.4
else
  echo "Brew is missing, can't install valet" && exit 1;
fi

if command -v composer &>/dev/null; then
  composer global require weprovide/valet-plus &&
  valet fix &&
  valet install --with-mariadb

  read -p "Create project folders & Valet park? [Y/n] " -n 1
  echo ""
  if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    mkdir ~/projects
    valet park ~/projects

    mkdir ~/projects/react
    mkdir ~/projects/vue

    mkdir ~/projects/magento
    valet park ~/projects/magento

    mkdir ~/projects/wordpress
    valet park ~/projects/wordpress
  fi
else
  echo "Composer is missing, can't install valet" && /
  echo "Run the dotfiles/valet/setup.sh, when you're ready"
fi
