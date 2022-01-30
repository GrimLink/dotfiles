#!/bin/bash

if command -v valet &> /dev/null; then
  valet park ~/projects
  valet park ~/projects/magento
  valet park ~/projects/wordpress
else
  echo "Valet is missing, can't park in project folders"
fi
