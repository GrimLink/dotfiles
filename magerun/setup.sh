#!/bin/bash

# Download our own magerun
# Instead the one used by valet

echo "Installing Magerun"
curl -sS -O https://files.magerun.net/n98-magerun.phar
mv -f n98-magerun.phar /usr/local/bin/n98-magerun
chmod +x /usr/local/bin/n98-magerun
ln -s /usr/local/bin/n98-magerun /usr/local/bin/magerun

echo "Installing Magerun2"
curl -sS -O https://files.magerun.net/n98-magerun2.phar
mv -f n98-magerun2.phar /usr/local/bin/n98-magerun2
chmod +x /usr/local/bin/n98-magerun2
ln -s /usr/local/bin/n98-magerun2 /usr/local/bin/magerun2
