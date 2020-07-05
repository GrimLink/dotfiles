#!/bin/bash

if command -v zsh &>/dev/null; then
  # Install it, if not already
  if ! command -v brew &>/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  if command -v brew &>/dev/null; then
    brew install zsh
    # And set zsh as default $SHELL (may require a reboot)
    chsh -s /usr/local/bin/zsh
  else
    echo "Installation of zsh failed, brew is missing"
  fi
fi

# Setup install folder for plugins
mkdir -p "$HOME/.zsh"

echo "Installing zsh sindresorhus/pure theme.."
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

echo "Installing zsh syntax highlighting.."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/syntax-highlighting"

echo "Instaling zsh nvm.."
git clone https://github.com/lukechilds/zsh-nvm.git "$HOME/.zsh/nvm"

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
