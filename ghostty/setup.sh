#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

GHOSTTY_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"

StepSection "Syncing Ghostty config to the Library Application Support folder"
rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/config.ghostty" "$GHOSTTY_DIR"

# Ghostty still reads the pre 1.2.3 `config` name, and loads it after
# `config.ghostty`, so a leftover would override everything synced above.
rm -f "$GHOSTTY_DIR/config"
