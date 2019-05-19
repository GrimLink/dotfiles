#!/bin/bash

# code --list-extensions
function installCodeExt() {
  VSCODE_EXT=(
    cssho.vscode-svgviewer
    mrmlnc.vscode-duplicate
    CoenraadS.bracket-pair-colorizer
    deerawan.vscode-faker
    msjsdiag.debugger-for-chrome
    ritwickdey.LiveServer
    streetsidesoftware.code-spell-checker
    # Theme
    tobiasalthoff.atom-material-theme
    file-icons.file-icons
    # Markdown
    yzhang.markdown-all-in-one
    bierner.markdown-emoji
    bierner.markdown-preview-github-styles
    # Git
    eamodio.gitlens
    GitHub.vscode-pull-request-github
    # Linting
    EditorConfig.EditorConfig
    shinnn.stylelint
    dbaeumer.vscode-eslint
    esbenp.prettier-vscode
    # Syntax
    apollographql.vscode-apollo
    jock.svg
    shanoor.vscode-nginx
    mikestead.dotenv
    mariusschulz.yarn-lock-syntax
    # Formatter
    aaron-bond.better-comments
    felixfbecker.php-pack
    octref.vetur
    raynigon.nginx-formatter
  )
  for i in "${VSCODE_EXT[@]}"; do
    code --install-extension $i
  done
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  installCodeExt
else
  read -p "Install VSCode extensions. Are you sure? (y) " -n 1
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    if ! command -v code &>/dev/null; then
      echo -e "The VSCode command is not installed \nPlease install it to run the setup for VSCode! \nThen re run this setup script or the vscode/setup script\n"
    else
      installCodeExt
    fi
  fi
fi

unset installCodeExt
