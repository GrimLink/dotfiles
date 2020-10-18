#!/bin/bash

# Get and install
# This follows the same steps found on the valet docs
# -> https://github.com/weprovide/valet-plus/wiki/Installation
if ! command -v brew &>/dev/null; then
  brew tap henkrehorst/php
  brew install valet-php@7.3
  brew install valet-php@7.4
  # Composer is already installed in the brew setup
  brew install openssl
  # Fix for missing php apcu (https://github.com/weprovide/valet-plus/issues/492#issuecomment-647420696)
  ln -s /usr/local/etc/openssl@1.1 /usr/local/etc/openssl
  # Fix missing root user in mariadb
  brew install mariadb
  sudo mysqladmin -u root password # root for password
  # Fix connection error
  ln -s ~/.composer/vendor/weprovide/valet-plus/cli/stubs/elasticsearch.conf /usr/local/etc/nginx/valet/elasticsearch.conf
else
  echo "Brew is missing, can't install valet" && exit 1;
fi

if command -v composer &>/dev/null; then
  composer global require weprovide/valet-plus &&
  valet fix &&
  valet install --with-mariadb
  ps -efw | grep php-fm
else
  echo "Composer is missing, can't install valet" && exit 1;
fi

# Setup project folder
source $(dirname "${BASH_SOURCE}")/project.sh
