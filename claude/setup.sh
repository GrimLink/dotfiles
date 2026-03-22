#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

StepSection "Syncing Claude settings to ~/.claude"

rsync \
  --exclude ".DS_Store" \
  --exclude "README.md" \
  --exclude "setup.sh" \
  -avh --no-perms \
  "$(dirname "${BASH_SOURCE}")/." ~/.claude;
