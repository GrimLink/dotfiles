#!/bin/bash

# Install it, if not already
if ! command -v brew &>/dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  # Make sure we’re using the latest Homebrew.
  brew update

  # Upgrade any already-installed formulae.
  brew upgrade
fi

# Utils
brew install php
brew install composer
brew install node
brew install yarn
brew install imagemagick --with-webp
brew tap henkrehorst/php
brew install valet-php@7.1
brew install valet-php@7.2
brew install valet-php@7.3

# Remove outdated versions from the cellar.
brew cleanup
