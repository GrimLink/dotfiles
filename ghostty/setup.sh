#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

StepSection "Syncing Ghostty config to the Library Application Support folder"
rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/config" $HOME/Library/Application\ Support/com.mitchellh.ghostty
