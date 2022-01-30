#!/bin/bash

# Install it, if not already
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found, installing"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Via brew cask
if command -v brew &>/dev/null; then
  brew install --cask tableplus
  brew install --cask transmit
  brew install --cask fork
  brew install --cask vlc
  brew install --cask boostnote
  brew install --cask android-file-transfer
  # Editors
  brew install --cask graphiql
  brew install --cask postman
  # Communication
  brew install --cask slack
  brew install --cask discord
  brew install --cask signal
  brew install --cask whatsapp
  # Utils
  brew install --cask google-drive
  brew install --cask imageoptim
  brew install --cask appcleaner
  brew install --cask keka
  brew install --cask keepingyouawake
  # browsers
  brew install --cask homebrew/cask-versions/google-chrome-beta
  brew install --cask firefox
  brew install --cask brave-browser
else
  echo "brew is not installed"
fi

# Direct dowmloads, requires manual installation
echo "Opening Manual downloads"
open http://www.getmiro.com/download/for-osx/
open https://www.rode.com/software/rode-connect
open https://us.anker.com/pages/download-software
