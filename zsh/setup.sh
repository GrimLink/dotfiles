#!/bin/bash

# Setup install folder for plugins
mkdir -p "$HOME/.zsh"

echo "Installing zsh sindresorhus/pure theme.."
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

echo "Installing zsh syntax highlighting.."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/syntax-highlighting"

echo "Syncing zsh config.."
if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.zshrc" ~
else
  read -p "Update zsh config files. Are you sure? [Y/n] "
  echo ""
  if [[ ! $REPLY =~ ^[nN]|[nN][oO]$ ]]; then
    rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.zshrc" ~
  fi
fi
