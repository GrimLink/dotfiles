#!/bin/bash

if command -v brew &>/dev/null; then
  brew install --cask visual-studio-code

  defaults write com.apple.LaunchServices/com.apple.launchservices.secure LSHandlers -array-add '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.microsoft.VSCode;}'
else
  echo "Can't install vscode, brew is not installed"
fi
