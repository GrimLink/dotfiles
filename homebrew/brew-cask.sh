#!/bin/bash

# Install it, if not already
if ! command -v brew &> /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

APPS=(
  hyper
  sequel-pro
  tower
  transmit
  vlc
  dropbox
  boostnote
  # Editors
  visual-studio-code
  atom
  graphiql
  postman
  # Communication
  slack
  skype
  # Utils
  google-backup-and-sync
  imageoptim
  appcleaner
  keka
  keepingyouawake
)

for i in "${APPS[@]}"; do
  brew cask install $i
done
