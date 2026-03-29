#!/bin/bash

brew install --cask visual-studio-code

read -p "Install extensions? (Y/n): " INSTALL_EXTENSIONS
if [[ "$INSTALL_EXTENSIONS" == "" || "$INSTALL_EXTENSIONS" == "y" || "$INSTALL_EXTENSIONS" == "yes" ]]; then
  EXTENSIONS_FILE="$(dirname "${BASH_SOURCE}")/extensions"
  while IFS= read -r line; do
    [[ -z "$line" || "$line" == \#* ]] && continue
    code --install-extension "$line"
  done < "$EXTENSIONS_FILE"
fi
