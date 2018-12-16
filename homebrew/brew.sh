#!/bin/bash

# Installs all brew dependencies
if ! command -v brew &> /dev/null; then
  # Install it, if not already
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Utils
brew install php@7.1
brew install php@7.2
brew install composer
brew install node
brew install yarn
brew install imagemagick --with-webp

# Remove outdated versions from the cellar.
brew cleanup
