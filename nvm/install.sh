#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

StepSection "Setting nvm defaults"

if ! command -v nvm &> /dev/null; then
  echo "Let's make sure fig is running"
  fig source
fi

if ! command -v nvm &> /dev/null; then
  echo "NVM is missing please rerun this script, when nvm is installed"
else
  mkdir $HOME/.nvm
  nvm alias default system
  nvm install --lts
fi
