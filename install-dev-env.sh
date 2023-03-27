#!/bin/bash

RESET='\033[0m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
BOLD='\033[1m'
ITALIC='\033[3m'

function StepSection() { echo -e "${GREEN}$@${RESET}" }
function GroupSection() { echo -e "${BLUE}$@${RESET}" }

if ! xcode-select -p 1>/dev/null; then
  echo "Installing xcode-select"
  xcode-select --install
  echo "Or download it here https://developer.apple.com/download/more/"
  read -p "When Ready, press any key to continue" -n 1 && echo ""
fi

GroupSection "Configuring hyper.."
bash $(dirname "${BASH_SOURCE}")/hyper/setup.sh;

GroupSection "Configuring nvm.."
bash $(dirname "${BASH_SOURCE}")/nvm/setup.sh;

GroupSection "Configuring Valet.."
bash $(dirname "${BASH_SOURCE}")/valet/setup.sh;

echo ""
echo -e "${BOLD}Done${RESET} 🎉"
echo ""