#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'
GIT_NAME="$(git config --global --get user.name)"
GIT_EMAIL="$(git config --global --get user.email)"

function StepSection() { echo -e "${GREEN}$@${RESET}" }

StepSection "Syncing global gitignore to the local user folder"
rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.gitignore" ~

StepSection "Syncing gitconfig to the local user folder"
rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.gitconfig" ~

# Set user information back, if already set, else ask for it
if [ -n "$GIT_EMAIL" ]; then
  git config --global user.name "$GIT_NAME"
  git config --global user.email "$GIT_EMAIL"
else
  StepSection "Creating new git user for this system"
  read -p "Git user name: " NAME
  read -p "Git user email: " EMAIL

  git config --global user.name $NAME
  git config --global user.email $EMAIL
fi
