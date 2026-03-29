#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'
BOLD='\033[1m'

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

StepSection "Installing Rust via rustup"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

StepSection "Adding Cargo to PATH"
echo '. "$HOME/.cargo/env"' >> "$HOME/.zshenv"

echo ""
echo -e "${BOLD}Done${RESET}"
echo "Restart your shell or run: . \"\$HOME/.cargo/env\""
echo ""
