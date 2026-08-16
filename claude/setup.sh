#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

StepSection "Syncing Claude settings to ~/.claude"

mkdir -p ~/.claude
rsync \
  --exclude ".DS_Store" \
  --exclude "README.md" \
  --exclude "setup.sh" \
  --exclude "install.sh" \
  -avh --no-perms \
  "$(dirname "${BASH_SOURCE}")/." ~/.claude;

StepSection "Linking Claude to the shared agent config"

# Instructions and skills live in ~/.agents so every agent reads the same copy
ln -sfn ~/.agents/AGENTS.md ~/.claude/CLAUDE.md

if [ ! -L ~/.claude/skills ]; then
  rm -rf ~/.claude/skills
  ln -s ~/.agents/skills ~/.claude/skills
fi
