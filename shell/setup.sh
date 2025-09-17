#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

# Remove the default terminal message
touch .hushlogin

# Make sure there is a shell folder
if [ ! -d $HOME/.shell ]; then
  mkdir $HOME/.shell
fi

StepSection "Syncing all shell files to the system shell folder"
rsync -avh --no-perms \
  "$(dirname "${BASH_SOURCE}")/aliases" \
  "$(dirname "${BASH_SOURCE}")/exports" \
  "$(dirname "${BASH_SOURCE}")/functions" \
  "$(dirname "${BASH_SOURCE}")/applications" \
  $HOME/.shell
