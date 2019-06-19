#!/bin/bash

RESET='\033[0m'
BOLD='\033[1m'
ITALIC='\033[3m'
GREEN='\033[1;32m'

# Go to dotfile
cd "$(dirname "${BASH_SOURCE}")"

# Make sure if xcode-select is installed
if xcode-select -p 1>/dev/null; then
 echo -e "${GREEN}xcode-select already installed${RESET}"
else
  echo "${GREEN}Installing xcode-select${RESET}"
  xcode-select --install
  read -p "When Ready, press any key to continue" -n 1
  echo ""
fi

# If it has the flag `--force` or `-f`.
# Then don't ask for each task

echo "${GREEN}Setting up mac defaults${RESET}"
source macos/setup.sh

echo "${GREEN}Setting up shell${RESET}"
read -p "Use zsh as shell? (Y/n) " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  source zsh/setup.sh
else
  source bash/setup.sh
fi
source shell/setup.sh

echo "${GREEN}Setting up Brew${RESET}"
source brew/brew.sh

echo "${GREEN}Setting up Node${RESET}"
source node/setup.sh

echo "${GREEN}Setting up git & ssh${RESET}"
source git/setup.sh
source git/ssh.sh

echo "${GREEN}Setting up valet+${RESET}"
source valet-plus/setup.sh

echo "${GREEN}Setting up bin tools${RESET}"
source bin/setup.sh
source magerun/setup.sh

# Make sure we are using the latest shell env
exec $SHELL -l

echo "${GREEN}Installing apps${RESET}"
source brew/app.sh
source vscode/extensions.sh
source vscode/config.sh

echo "Almost there"
echo "These apps require to be installed by hand"
echo " - Chrome Beta: https://www.google.com/chrome/beta/"
echo " - SkyFonts: https://www.fonts.com/web-fonts/google"
echo " - Android File Transfer: In ~/Downloads"
echo " - Miro Video Converter: In ~/Downloads"

cd ~/Downloads
curl -sS -O https://dl.google.com/dl/androidjumper/mtp/current/AndroidFileTransfer.dmg
curl -sS -O http://getmiro.com/files/MiroVideoConverter.dmg

echo ""
echo "-----"
echo -e "${BOLD}Done${RESET} 🎉"
echo -e "${ITALIC}Some settings require a reboot to take effect, e.g. macos settings${RESET}"
echo "-----"
echo ""



