#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'
RED='\033[1;31m'
GIT_EMAIL="$(git config --global --get user.email)"

function StepSection() {
    echo -e "${GREEN}$@${RESET}"
}

function ErrorSection() {
    echo -e "${RED}$@${RESET}"
}

if [ -n "$GIT_EMAIL" ]; then
    if [[ ! -f ~/.ssh/id_rsa ]]; then
        StepSection "Creating new ssh key"
        ssh-keygen -o -t rsa -b 4096 -C "$GIT_EMAIL" &&
        eval $(ssh-agent) &&
        ssh-add --apple-use-keychain --apple-load-keychain ~/.ssh/id_rsa
        pbcopy <~/.ssh/id_rsa.pub
    fi

    if [[ ! -f ~/.ssh/config ]]; then
        StepSection "Creating ssh config file"
        touch ~/.ssh/config &&
        echo "Host *" >>~/.ssh/config &&
        echo "  AddKeysToAgent yes" >>~/.ssh/config &&
        echo "  UseKeychain yes" >>~/.ssh/config &&
        echo "  IdentityFile ~/.ssh/id_rsa" >>~/.ssh/config &&
    fi
else
    ErrorSection "No git config found! Skipped ssh setup step"
fi