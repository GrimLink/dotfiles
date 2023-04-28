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

StepSection "Install create project (https://github.com/GrimLink/create-project)"
bash -c "$(curl -LsS ${GIT_BASEURL}/create-project/main/install.sh)"

# Make all bin files executable
find ~/bin -type f -iname "*" -exec chmod +x {} \;

