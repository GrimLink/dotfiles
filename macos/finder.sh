#!/bin/bash

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Use full POSIX path as window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'

# Do not show recent tags
defaults write com.apple.finder ShowRecentTags -bool false

# Show all filename extensions
defaults write -g AppleShowAllExtensions -bool true

# Set sidebar icon size to large
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 3

# Search the current directory by default
defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Set Downloads as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/"

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

killall "Finder" &> /dev/null
