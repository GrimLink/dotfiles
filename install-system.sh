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

GroupSection "Configuring shell and bin.."
bash $(dirname "${BASH_SOURCE}")/zsh/setup.sh;
bash $(dirname "${BASH_SOURCE}")/shell/setup.sh;
bash $(dirname "${BASH_SOURCE}")/bin/setup.sh;

GroupSection "Configuring git.."
bash $(dirname "${BASH_SOURCE}")/git/ssh.sh;
bash $(dirname "${BASH_SOURCE}")/git/setup.sh;

GroupSection "Running brew install actions.."
bash $(dirname "${BASH_SOURCE}")/brew/install.sh;

GroupSection "Running nvm install action.."
bash $(dirname "${BASH_SOURCE}")/nvm/install.sh;

echo ""
echo -e "${BOLD}Done${RESET} 🎉"
echo ""