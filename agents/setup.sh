#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

AGENTS_DIR="$(dirname "${BASH_SOURCE}")"

StepSection "Syncing agent instructions to ~/.agents"

mkdir -p ~/.agents
rsync --exclude ".DS_Store" -avh --no-perms \
  "$AGENTS_DIR/AGENTS.md" ~/.agents

StepSection "Syncing skills to ~/.agents/skills"

mkdir -p ~/.agents/skills
rsync \
  --exclude ".DS_Store" \
  --exclude "README.md" \
  -avh --no-perms \
  "$AGENTS_DIR/skills/." ~/.agents/skills

StepSection "Fetching external skills"

mkdir -p ~/.agents/skills/fylgja
curl -fsSL "https://raw.githubusercontent.com/fylgja/fylgja/refs/heads/main/ai-skill/SKILL.md" \
  -o ~/.agents/skills/fylgja/SKILL.md
