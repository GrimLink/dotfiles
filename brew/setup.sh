#!/bin/bash

# Install it, if not already
if ! command -v brew &>/dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Run brew install pkg's
if command -v brew &>/dev/null; then
  # Install node & yarn
  brew install yarn
  brew install node@12 # Get last lts version
  # Install php + latest stable 3 henkrehorst/php versions
  brew install php
  brew tap henkrehorst/php
  brew install valet-php@7.1
  brew install valet-php@7.2
  brew install valet-php@7.3
  # Install javajdk8 (osx needed version) + elasticsearch that needs java
  brew cask install homebrew/cask-versions/adoptopenjdk8
  brew install elasticsearch@5.6
  # Install composer
  brew install composer
  # Install image converter
  brew install imagemagick
else
  echo "brew is not installed"
fi
