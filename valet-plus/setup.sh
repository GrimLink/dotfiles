#!/bin/bash

# Get and install
if command -v composer &> /dev/null; then
  composer global require weprovide/valet-plus &&
  valet fix &&
  valet install --with-mariadb;

  read -p "Create project folders & Valet park? (y) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    mkdir ~/projects;
    valet park ~/projects;

    mkdir ~/projects/react;
    mkdir ~/projects/vue;

    mkdir ~/projects/magento;
    valet park ~/projects/magento;

    mkdir ~/projects/wordpress;
    valet park ~/projects/wordpress;
  fi
else
  echo "Composer is missing, can't install valet" && /
  echo "Run the dotfiles/valet/setup.sh, when you're ready"
fi
