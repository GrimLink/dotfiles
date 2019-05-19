#!/bin/bash

# Create default ssh key
ssh-keygen -o -t rsa -b 4096 -C "$(git config --global --get user.email)" && /
eval $(ssh-agent) && /
ssh-add -K ~/.ssh/id_rsa && /
touch ~/.ssh/config && /
echo "Host *" >>~/.ssh/config && /
echo "  AddKeysToAgent yes" >>~/.ssh/config && /
echo "  UseKeychain yes" >>~/.ssh/config && /
echo "  IdentityFile ~/.ssh/id_rsa" >>~/.ssh/config && /
pbcopy <~/.ssh/id_rsa.pub
