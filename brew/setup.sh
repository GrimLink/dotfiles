#!/bin/bash

# Install it, if not already
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Run brew install pkg's
if command -v brew &>/dev/null; then
  # Install node & yarn
  brew install yarn # Also installs the Latest Node
  # Install php + latest stable 3 henkrehorst/php versions
  brew install php
  # Install javajdk8 (osx needed version) + elasticsearch that needs java
  brew cask install homebrew/cask-versions/adoptopenjdk8
  brew install elasticsearch
  # Install composer
  brew install composer
  # Install image converter
  brew install imagemagick
  # Install git tools
  brew install hub
else
  echo "brew is not installed"
fi
