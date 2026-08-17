#!/bin/bash

# Zsh themes
brew install pure

# Zsh plugins
brew install zsh-syntax-highlighting

# Lay down the base config. Install only, never a re-sync: other scripts
# append to ~/.zshrc afterwards and copying over it would drop their lines.
rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.zshrc" ~
