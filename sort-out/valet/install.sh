#!/bin/bash

# Get and install
# This follows the similar steps found on the valet docs
# -> https://github.com/weprovide/valet-plus/wiki/Installation
if ! command -v brew &>/dev/null; then
  brew tap henkrehorst/php
  brew unlink php
  brew install valet-php@7.4 --build-from-source
  brew link --overwrite valet-php@7.4
  # Fix for missing php apcu (https://github.com/weprovide/valet-plus/issues/492#issuecomment-647420696)
  ln -s /usr/local/etc/openssl@1.1 /usr/local/etc/openssl
  # Make sure we use the latest mariadb version that is supported by Magento 2
  brew install mariadb@10.4
  brew link mariadb@10.4
  brew services start mariadb@10.4
else
  echo "Brew is missing, can't install valet" && exit 1;
fi

if command -v composer &>/dev/null; then
  composer global require weprovide/valet-plus &&
  valet fix &&
  valet install --with-mariadb
  # Fix missing root user in mysql
  sudo mysqladmin -u root password

  # Install extra valet tools
  valet elasticsearch install

  # Test if valet is working
  ping -c1 localhost.test # random test url, can be anything ending with .test
  ping -c1 localhost.test:9200 # eleasticsearch
  ping -c1 mailhog.test # mailhog
else
  echo "Composer is missing, can't install valet" && exit 1;
fi
