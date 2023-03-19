#!/bin/bash

# Install it, if not already
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Run brew install pkg's
if command -v brew &>/dev/null; then
  # Setup node based deps
  brew install node
  brew install nvm

  # Setup php based deps
  brew install php
  brew install composer
else
  echo "brew is not installed"
fi
