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

# Apps
brew cask install firefox-developer-edition
brew cask install hyper
brew cask install sequel-pro
brew cask install tower
brew caks install transmit
brew cask install vlc
brew cask install dropbox
brew cask install boostnote
## Editor
brew cask install visual-studio-code
brew cask install atom
brew cask install graphiql
brew caks install postman
## Communication
brew cask install slack
brew cask install skype
## Utils
brew cask install google-backup-and-sync
brew cask install imageoptim
brew cask install appcleaner
brew cask install keka
brew cask install keepingyouawake

# Remove outdated versions from the cellar.
brew cleanup
