#!/bin/bash

SHELL_RC="$HOME/.bashrc"
[ -f "$HOME/.zshrc" ] && SHELL_RC="$HOME/.zshrc"

brew install php
brew install composer

# Check if there is a `$HOME/.composer` path else add this path as a symlink
# This needed for older Magento 2 projects
if [ ! -d "$HOME/.composer" ]; then
	ln -s ~/.config/composer ~/.composer
fi
