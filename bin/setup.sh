#!/bin/bash

GIT_URL="https://raw.githubusercontent.com/GrimLink/"

if [ ! -d ~/bin ]; then
  mkdir ~/bin
fi

function rsyncBin() {
  rsync \
    --exclude ".DS_Store" \
    --exclude "README.md" \
    --exclude "setup.sh" \
    -avh --no-perms \
    "$(dirname "${BASH_SOURCE}")/." ~/bin
  # Make all bin files executable
  find ~/bin -type f -iname "*" -exec chmod +x {} \;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsyncBin

  echo -e "${YELLOW}Getting mage${RESET}"
  curl -sS -O $GIT_URL/mage/master/mage

  echo -e "${YELLOW}Getting create-project${RESET}"
  bash -c "$(curl -LsS https://raw.githubusercontent.com/GrimLink/create-project/master/install.sh)"
else
  read -p "Update bin files? (y) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    rsyncBin

    echo -e "${YELLOW}Getting mage${RESET}"
    curl -sS -O $GIT_URL/mage/master/mage

    echo -e "${YELLOW}Getting create-project${RESET}"
    bash -c "$(curl -LsS https://raw.githubusercontent.com/GrimLink/create-project/master/install.sh)"
  fi
fi

unset rsyncBin
