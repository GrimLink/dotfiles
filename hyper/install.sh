#!/bin/bash

if command -v brew &>/dev/null; then
  brew install --cask hyper
else
  echo "Can't install hyper, brew is not installed"
fi
