#!/bin/bash

# Install it, if not already
if ! command -v brew &> /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Apps
brew cask install firefox-developer-edition
brew cask install hyper
brew cask install sequel-pro
brew cask install tower
brew cask install transmit
brew cask install vlc
brew cask install dropbox
brew cask install boostnote
## Editors
brew cask install visual-studio-code
brew cask install atom
brew cask install graphiql
brew csask install postman
## Communication
brew cask install slack
brew cask install skype
## Utils
brew cask install google-backup-and-sync
brew cask install imageoptim
brew cask install appcleaner
brew cask install keka
brew cask install keepingyouawake
