#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'
GIT_BASEURL="https://raw.githubusercontent.com/GrimLink"

function StepSection() { echo -e "${GREEN}$@${RESET}" }

# Make sure there is a bin folder
if [ ! -d ~/bin ]; then
  mkdir ~/bin
fi

StepSection "Syncing all bin files to the system bin folder"
rsync \
  --exclude ".DS_Store" \
  --exclude "README.md" \
  --exclude "setup.sh" \
  -avh --no-perms \
  "$(dirname "${BASH_SOURCE}")/." ~/bin;

StepSection "Install n98-magerun2 (https://github.com/netz98/n98-magerun2)"
curl -sS -O https://files.magerun.net/n98-magerun2.phar && \
mv n98-magerun2.phar /usr/local/bin/n98-magerun2 && \
chmod +x /usr/local/bin/n98-magerun2 && \
ln -s /usr/local/bin/n98-magerun2 /usr/local/bin/magerun2

StepSection "Install Mage (https://github.com/GrimLink/mage)"
curl -sS -O "${GIT_BASEURL}/mage/main/mage" && mv mage ~/bin

StepSection "Install create project (https://github.com/GrimLink/create-project)"
bash -c "$(curl -LsS ${GIT_BASEURL}/create-project/main/install.sh)"

# Make all bin files executable
find ~/bin -type f -iname "*" -exec chmod +x {} \;

