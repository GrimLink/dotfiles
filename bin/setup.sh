#!/bin/bash

GIT_URL="https://raw.githubusercontent.com/GrimLink"

if [ ! -d ~/bin ]; then
  mkdir ~/bin
fi

function rsyncBin() {
  rsync \
    --exclude ".DS_Store" \
    --exclude "README.md" \
    --exclude "setup.sh" \
    -avh --no-perms \
    "$(dirname "${BASH_SOURCE}")/." ~/bin;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsyncBin

  echo -e "${YELLOW}Getting mage${RESET}"
  curl -sS -O "${GIT_URL}/mage/master/mage" &&
    mv mage ~/bin

  echo -e "${YELLOW}Getting create-project${RESET}"
  bash -c "$(curl -LsS ${GIT_URL}/create-project/master/install.sh)"

  # Make all bin files executable
  find ~/bin -type f -iname "*" -exec chmod +x {} \;
else
  read -p "Update bin files? [Y/n] " -n 1
  echo ""
  if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    rsyncBin

    echo -e "${YELLOW}Getting mage${RESET}"
    curl -sS -O "${GIT_URL}/mage/master/mage" &&
      mv mage ~/bin

    echo -e "${YELLOW}Getting create-project${RESET}"
    bash -c "$(curl -LsS ${GIT_URL}/create-project/master/install.sh)"

    # Make all bin files executable
    find ~/bin -type f -iname "*" -exec chmod +x {} \;
  fi
fi

unset rsyncBin
