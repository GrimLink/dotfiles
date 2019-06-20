# Get Zsh
brew install zsh

# Set to zsh
chsh -s /bin/zsh

# Get theme
npm i -g pure-prompt

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.zshrc" ~
else
  read -p "Update Zsh config files. Are you sure? (Y/n) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.zshrc" ~
  fi
fi
