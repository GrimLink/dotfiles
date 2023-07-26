#!/bin/bash

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 68

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Disable the opening of an application from the Dock animations.
defaults write com.apple.dock launchanim -bool false

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Do not show recent applications in Dock
defaults write com.apple.dock showhidden -bool true

killall "Dock" &> /dev/null
