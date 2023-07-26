#!/bin/bash

# Enable 'Secure Keyboard Entry
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Hide line marks
defaults write com.apple.Terminal ShowLineMarks -int 0

# Only use UTF-8
defaults write com.apple.terminal StringEncodings -array 4
