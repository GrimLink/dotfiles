#!/bin/bash

function installCodeExt() {
  VSCODE_EXT=(
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
  )
  for EXT in $VSCODE_EXT; do
    code --install-extension $EXT
  done
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  installCodeExt;
else
  read -p "Install VSCode extensions. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    if ! command -v code &> /dev/null; then
      echo -e "The VSCode command is not installed \nPlease install it to run the setup for VSCode! \nThen re run this setup script or the vscode/setup script\n"
    else
      installCodeExt;
    fi;
  fi;
fi;

unset installCodeExt;

function rsyncVSCodeConfig() {
  rsync -avh --no-perms \
  "$(dirname "${BASH_SOURCE}")/config/settings.json" \
  "$(dirname "${BASH_SOURCE}")/config/keybindings.json" \
  "$(dirname "${BASH_SOURCE}")/config/snippets" \
  $HOME/Library/Application\ Support/Code/User;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsyncVSCodeConfig;
else
  read -p "Update VSCode config files. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    rsyncVSCodeConfig;
  fi;
fi;

unset rsyncVSCodeConfig;

echo -e "Make sure to reboot vsode\n"
