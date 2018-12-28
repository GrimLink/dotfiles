#!/bin/bash

# Go to dotfile
cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

# Alway check if xcode-select is there
if ! command -v xcode-select &> /dev/null; then
  xcode-select --install
fi

# If it has the flag `--force` or `-f`.
# Then don't ask for each task
source shell/setup.sh;
source git/setup.sh;
source vscode/setup.sh;
source hyper/setup.sh;
