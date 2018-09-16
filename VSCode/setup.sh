#!/bin/bash

SUCCESS_MESSAGE="\033[0;32m✓ Done\033[0m"

function installCodeExt() {
  VSCODE_EXT="
    EditorConfig.EditorConfig
    Archety.material-icons
    bierner.markdown-preview-github-styles
    CoenraadS.bracket-pair-colorizer
    cssho.vscode-svgviewer
    deerawan.vscode-faker
    file-icons.file-icons
    fireyy.vscode-language-todo
    glen-84.sass-lint
    JakeWilson.vscode-placeholder-images
    jock.svg
    mrmlnc.vscode-duplicate
    msjsdiag.debugger-for-chrome
    octref.vetur
    PeterJausovec.vscode-docker
    ritwickdey.LiveServer
    shinnn.stylelint
    tobiasalthoff.atom-material-theme
    yzhang.markdown-all-in-one
    felixfbecker.php-intellisense
  "
  for EXT in $VSCODE_EXT; do
    code --install-extension $EXT
  done
}

function rsyncCodeConfig() {
  rsync -avh --no-perms \
  "$(dirname "${BASH_SOURCE}")/config/settings.json" \
  "$(dirname "${BASH_SOURCE}")/config/keybindings.json" \
  "$(dirname "${BASH_SOURCE}")/config/snippets" \
  $HOME/Library/Application\ Support/Code/User;
  echo -e "$SUCCESS_MESSAGE\n"
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  installCodeExt;
else
  read -p "Install VSCode extensions. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    installCodeExt;
  fi;
fi;

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsyncCodeConfig;
else
  read -p "Update VSCode config files. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    rsyncCodeConfig;
  fi;
fi;

echo -e "Make sure to reboot vsode\n$SUCCESS_MESSAGE"
unset installCodeExt;
unset rsyncCodeConfig;
