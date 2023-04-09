#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

StepSection "Instaling nvm"
git clone https://github.com/lukechilds/zsh-nvm.git "$HOME/.zsh/nvm"
# Reload shell, to take effect from adding nvm
# The .zshrc contains the loader for nvm
exec $SHELL -l

StepSection "Setting nvm defaults"
mkdir ~/.nvm
nvm alias default system
nvm install --lts
