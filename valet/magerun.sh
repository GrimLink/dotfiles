#!/bin/bash

# Download our own magerun
# Instead the one used by valet

# Magerun
curl -sS -O https://files.magerun.net/n98-magerun.phar &&
chmod +x n98-magerun.phar &&
mv -f n98-magerun.phar /usr/local/bin/magerun

# Magerun2
curl -sS -O https://files.magerun.net/n98-magerun2.phar &&
chmod +x n98-magerun2.phar &&
mv -f n98-magerun2.phar /usr/local/bin/magerun2
