#!/bin/bash

# Get and install
# This follows the similar steps found on the valet docs
# -> https://github.com/weprovide/valet-plus/wiki/Installation
if ! command -v brew &>/dev/null; then
  brew tap henkrehorst/php
  brew install valet-php@7.4
  # Fix for missing php apcu (https://github.com/weprovide/valet-plus/issues/492#issuecomment-647420696)
  ln -s /usr/local/etc/openssl@1.1 /usr/local/etc/openssl
  # Make sure we use the latest mariadb version that is supported by Magento 2
  brew install mariadb@10.4
else
  echo "Brew is missing, can't install valet" && exit 1;
fi

if command -v composer &>/dev/null; then
  composer global require weprovide/valet-plus &&
  valet fix &&
  valet install --with-mariadb
  # Fix missing root user in mysql
  sudo mysqladmin -u root password
else
  echo "Composer is missing, can't install valet" && exit 1;
fi
