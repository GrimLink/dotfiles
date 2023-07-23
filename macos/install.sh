#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
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

# TODO set macos settings here
StepSection "Settings System settings"
StepSection "Settings Finder settings"
StepSection "Settings Safari Settings, for development"
