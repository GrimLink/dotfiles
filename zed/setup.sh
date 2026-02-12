#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

StepSection "Syncing Zed settings to the .config folder"
rsync -avh --no-perms \
  "$(dirname "${BASH_SOURCE}")/settings.json" \
  "$(dirname "${BASH_SOURCE}")/keymap.json" \
  $HOME/.config/zed
