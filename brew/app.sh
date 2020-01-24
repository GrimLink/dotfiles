#!/bin/bash

# Install it, if not already
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found, installing"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if command -v brew &>/dev/null; then
  brew cask install hyper
  brew cask install tableplus
  brew cask install transmit
  brew cask install vlc
  brew cask install boostnote
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
fi
