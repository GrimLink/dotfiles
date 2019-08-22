#!/bin/bash

# get all extensions via `code --list-extensions`
function installCodeExt() {
  VSCODE_EXT=(
    aaron-bond.better-comments
    apollographql.vscode-apollo
    bierner.markdown-emoji
    bierner.markdown-preview-github-styles
    burkeholland.simple-react-snippets
    CoenraadS.bracket-pair-colorizer
    cssho.vscode-svgviewer
    dbaeumer.vscode-eslint
    deerawan.vscode-faker
    eamodio.gitlens
    EditorConfig.EditorConfig
    esbenp.prettier-vscode
    file-icons.file-icons
    GitHub.vscode-pull-request-github
    jock.svg
    jspolancor.presentationmode
    mariusschulz.yarn-lock-syntax
    mikestead.dotenv
    mrmlnc.vscode-duplicate
    msjsdiag.debugger-for-chrome
    octref.vetur
    raynigon.nginx-formatter
    ritwickdey.LiveServer
    shanoor.vscode-nginx
    shinnn.stylelint
    streetsidesoftware.code-spell-checker
    tobiasalthoff.atom-material-theme
    yzhang.markdown-all-in-one
  )
  for i in "${VSCODE_EXT[@]}"; do
    code --install-extension $i
  done
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  installCodeExt
else
  read -p "Install VSCode extensions. Are you sure? [Y/n] " -n 1
  echo ""
  if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    if ! command -v code &>/dev/null; then
      echo -e "The VSCode command is not installed \nPlease install it to run the setup for VSCode! \nThen re run this setup script or the vscode/setup script\n"
    else
      installCodeExt
    fi
  fi
fi

unset installCodeExt
