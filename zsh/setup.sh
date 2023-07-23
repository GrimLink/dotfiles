#!/bin/bash

# Copy Zsh config
rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.zshrc" ~
