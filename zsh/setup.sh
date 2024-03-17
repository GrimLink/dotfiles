#!/bin/bash

# Copy Zsh config
rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.zshrc" ~

# nvm autocomplete
git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh-nvm
