#!/bin/bash

# This is inspired by;
# - https://github.com/mathiasbynens/dotfiles
# - https://github.com/alrra/dotfiles
#
# But I am only using what I feel, I need to use

RESET='\033[0m'
GREEN='\033[1;32m'

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

# Define helper for running each script
function runAction() {
  echo -e "\n${GREEN}$1${RESET}"

  if ! bash $(dirname "${BASH_SOURCE}")/$2.sh; then
    echo -e "${BOLD}${RED}Error: Failed to configure ${2}${RESET}"
  fi
}

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this script is finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure there is /usr/local/bin folder, not a default folder for bin since M1 chips
if [ ! -d "/usr/local/bin" ]; then
  sudo mkdir -p usr/local/bin
fi

StepSection "Creating the Developer folder for all you developer projects"
mkdir -p $HOME/Developer

StepSection "Cleaning Dock from all defealt icons"
defaults write com.apple.dock persistent-apps -array

runAction "Settings System settings" system
runAction "Settings Finder settings" finder
runAction "Settings Dock settings" dock
runAction "Settings Input settings, Trackpad, Mouse, etc.." input
runAction "Settings App Settings" apps
runAction "Settings Safari Settings, for development" safari
runAction "Settings Terminal Settings" terminal
