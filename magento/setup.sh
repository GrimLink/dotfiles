#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'
GIT_BASEURL="https://raw.githubusercontent.com/GrimLink"

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

# Make sure there is a bin folder
if [ ! -d ~/bin ]; then
  mkdir ~/bin
fi

StepSection "Install Mage (https://github.com/GrimLink/mage)"
curl -sS -O "${GIT_BASEURL}/mage/main/mage" && mv mage ~/bin

StepSection "Install n98-magerun2 (https://github.com/netz98/n98-magerun2)"
curl -sS -O https://files.magerun.net/n98-magerun2.phar && \
mv n98-magerun2.phar $HOME/bin/n98-magerun2 && \
chmod +x $HOME/bin/n98-magerun2 && \
ln -s $HOME/bin/n98-magerun2 $HOME/bin/magerun2

StepSection "Install mage2tv cache-clean (https://github.com/mage2tv/magento-cache-clean)"
composer global require mage2tv/magento-cache-clean
