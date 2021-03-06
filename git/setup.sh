#!/bin/bash

function rsyncGitIgnore() {
  rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.gitignore" ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsyncGitIgnore
else
  read -p "Add gitignore files. Are you sure? [Y/n] "
  echo ""
  if [[ ! $REPLY =~ ^[nN]|[nN][oO]$ ]]; then
    rsyncGitIgnore
  fi
fi

unset rsyncGitIgnore

function rsyncGitConfig() {
  if [ -n "$(git config --global --get user.email)" ]; then
    GIT_NAME="$(git config --global --get user.name)"
    GIT_EMAIL="$(git config --global --get user.email)"

    rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.gitconfig" ~

    git config --global user.name "$GIT_NAME"
    git config --global user.email "$GIT_EMAIL"
  else
    rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.gitconfig" ~

    read -p "Git user name: " NAME
    read -p "Git user email: " EMAIL

    git config --global user.name $NAME
    git config --global user.email $EMAIL
  fi

  # Sync gitconfig init template
  mkdir -p ~/.config/git
  rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/template" ~/.config/git
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsyncGitConfig
else
  read -p "add git config files. Are you sure? [Y/n] "
  echo ""
  if [[ ! $REPLY =~ ^[nN]|[nN][oO]$ ]]; then
    rsyncGitConfig
  fi
fi

unset rsyncGitConfig
