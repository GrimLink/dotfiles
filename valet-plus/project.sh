#!/bin/bash

if command -v valet &> /dev/null; then
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
  echo "Valet is missing, can't setup project folders"
fi
