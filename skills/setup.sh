#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

SKILLS_DIR="$(dirname "${BASH_SOURCE}")"
RSYNC_ARGS=(--exclude ".DS_Store" --exclude "README.md" --exclude "setup.sh" -avh --no-perms)

StepSection "Syncing skills to ~/.agents/skills"
mkdir -p ~/.agents/skills
rsync "${RSYNC_ARGS[@]}" "$SKILLS_DIR/." ~/.agents/skills

if [ -d ~/.claude ] && [ ! -L ~/.claude/skills ]; then
  StepSection "Linking ~/.claude/skills -> ~/.agents/skills"
  rm -rf ~/.claude/skills
  ln -s ~/.agents/skills ~/.claude/skills
fi
