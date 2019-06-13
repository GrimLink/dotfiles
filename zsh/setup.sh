# Get Zsh
brew install zsh

# Set to zsh
chsh -s /bin/zsh

# Get theme
npm i -g pure-prompt

function rsyncZshConfig() {
  rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.zshrc" ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsyncZshConfig
else
  read -p "Update Zsh config files. Are you sure? (Y/n) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    rsyncZshConfig
  fi
fi

unset rsyncZshConfig
