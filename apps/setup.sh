#!/bin/bash

# Install it, if not already
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found, installing"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Via brew cask
if command -v brew &>/dev/null; then
  brew cask install hyper
  brew cask install tableplus
  brew cask install transmit
  brew cask install fork
  brew cask install vlc
  brew cask install boostnote
  brew cask install android-file-transfer
  # Editors
  brew cask install visual-studio-code
  brew cask install graphiql
  brew cask install postman
  # Communication
  brew cask install slack
  brew cask install discord
  brew cask install skype
  brew cask install whatsapp
  # Utils
  brew cask install dropbox
  brew cask install google-backup-and-sync
  brew cask install imageoptim
  brew cask install appcleaner
  brew cask install keka
  brew cask install keepingyouawake
  # browsers
  brew cask install homebrew/cask-versions/google-chrome-beta
  brew cask install firefox
else
  echo "brew is not installed"
fi

# Direct dowmloads, requires manual installation
echo "Opening Manual downloads"
open http://www.getmiro.com/download/for-osx/
