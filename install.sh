#!/bin/bash

# Go to dotfile
cd "$(dirname "${BASH_SOURCE}")";

# Alway check if xcode-select is there
if ! command -v xcode-select &> /dev/null; then
  xcode-select --install
fi

# If it has the flag `--force` or `-f`.
# Then don't ask for each task
source macos/setup.sh;
source shell/setup.sh;
source git/setup.sh;
source homebrew/brew-cask.sh;
source homebrew/brew.sh;
source valet/setup.sh;
source node/setup.sh;
