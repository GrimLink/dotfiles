#!/bin/bash

SHELL_RC="$HOME/.bashrc"
[ -f "$HOME/.zshrc" ] && SHELL_RC="$HOME/.zshrc"

brew install --cask visual-studio-code

echo "export EDITOR=\"code -w\"" >> "$SHELL_RC"
echo "export VISUAL=\"code -w\"" >> "$SHELL_RC"
