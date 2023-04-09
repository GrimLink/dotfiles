#!/bin/bash

# Setup install folder for plugins
mkdir -p "$HOME/.zsh"

echo "Installing zsh sindresorhus/pure theme.."
brew install pure

echo "Installing zsh syntax highlighting.."
brew install zsh-syntax-highlighting

echo -e "Adding zsh config to ${HOME}"
rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.zshrc" $HOME
