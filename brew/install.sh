#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'

function StepSection() { echo -e "${GREEN}$@${RESET}" }

StepSection "Installing homebrew (https://brew.sh/)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

StepSection "Installing node"
bash $(dirname "${BASH_SOURCE}")/node.sh;

StepSection "Installing php"
bash $(dirname "${BASH_SOURCE}")/php.sh;

StepSection "Installing db"
bash $(dirname "${BASH_SOURCE}")/db.sh;

StepSection "Installing other dev tools"
bash $(dirname "${BASH_SOURCE}")/dev.sh;

StepSection "Installing code editors"
bash $(dirname "${BASH_SOURCE}")/editor.sh;

StepSection "Installing apps (browsers, img tools, etc...)"
bash $(dirname "${BASH_SOURCE}")/app.sh;
