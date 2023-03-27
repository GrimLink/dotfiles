#!/bin/bash

RESET='\033[0m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
BOLD='\033[1m'
ITALIC='\033[3m'

function StepSection() { echo -e "${GREEN}$@${RESET}" }
function GroupSection() { echo -e "${BLUE}$@${RESET}" }

GroupSection "Updating git.."
bash $(dirname "${BASH_SOURCE}")/git/setup.sh;

GroupSection "Updating hyper.."
bash $(dirname "${BASH_SOURCE}")/hyper/setup.sh;

echo ""
echo -e "${BOLD}Done${RESET} 🎉"
echo ""