#!/bin/bash

SHELL_RC="$HOME/.bashrc"
[ -f "$HOME/.zshrc" ] && SHELL_RC="$HOME/.zshrc"

brew install --cask zed

echo "export EDITOR=\"zed -w\"" >> "$SHELL_RC"
echo "export VISUAL=\"zed -w\"" >> "$SHELL_RC"
