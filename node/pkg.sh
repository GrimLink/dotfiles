#!/bin/bash

# Installs all node Tools
function installNodeExt() {
  NODE_EXT=(
    # Auditing
    lighthouse
    hint
    wallace-cli # CSS
    # Compilers/Bundlers
    gulp-cli
    # Node Tools
    np # Better npm publish
  )
  for i in "${VSCODE_EXT[@]}"; do
    npm i -g $i
  done
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  installNodeExt
else
  read -p "Install Node Global packages. Are you sure? [Y/n] "
  echo ""
  if [[ ! $REPLY =~ ^[nN]|[nN][oO]$ ]]; then
    if ! command -v node &>/dev/null; then
      echo "Skipping.. NODE is not installed"
    else
      installNodeExt
    fi
  fi
fi

unset installNodeExt
