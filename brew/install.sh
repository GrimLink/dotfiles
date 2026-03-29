#!/bin/bash

# Define color codes for output
RESET='\033[0m'
GREEN='\033[1;32m'

SHELL_PROFILE="$HOME/.bash_profile"
[ -f "$HOME/.zshrc" ] && SHELL_PROFILE="$HOME/.zprofile"

echo -e "\n${GREEN}Installing homebrew (https://brew.sh/)${RESET}"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Add custom bin path if Homebrew is installed in 'opt'
if [[ -d /opt/homebrew ]]; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$SHELL_PROFILE"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo 'eval "$(/usr/local/bin/brew shellenv)"' >> "$SHELL_PROFILE"
  eval "$(/usr/local/bin/brew shellenv)"
fi

echo -e "\n${GREEN}Installing packages from Brewfile${RESET}"
brew bundle --file="$(dirname "${BASH_SOURCE}")/Brewfile"
