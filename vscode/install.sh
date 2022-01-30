#!/bin/bash

if command -v brew &>/dev/null; then
  brew install --cask visual-studio-code
else
  echo "Can't install vscode, brew is not installed"
fi
