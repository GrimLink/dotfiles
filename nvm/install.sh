#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

StepSection "Setting nvm defaults"
mkdir $HOME/.nvm
nvm alias default system
nvm install --lts
