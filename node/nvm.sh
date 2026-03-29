#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

StepSection "Installing NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

StepSection "Setting nvm defaults"
NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm alias default system
nvm install --lts

StepSection "Adding nvm auto-switch hook to .zshrc"
if [ -f "$HOME/.zshrc" ]; then
  cat >> "$HOME/.zshrc" << 'EOF'

# Register nvm auto-switch hook (load-nvmrc defined in ~/.shell/functions)
autoload -U add-zsh-hook
add-zsh-hook chpwd load-nvmrc
load-nvmrc
EOF
fi
