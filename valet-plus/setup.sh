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
else
  echo "Composer is missing, can't install valet" && exit 1;
fi

# Setup project folder
source $(dirname "${BASH_SOURCE}")/project.sh
