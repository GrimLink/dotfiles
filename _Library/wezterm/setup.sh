#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

StepSection "Syncing wezterm config to the local user folder"
rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.wezterm.lua" ~
