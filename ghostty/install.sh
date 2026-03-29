#!/bin/bash

brew install --cask ghostty

if [ ! -f "$HOME/.hushlogin" ]; then
  touch "$HOME/.hushlogin"
fi
