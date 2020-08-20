#!/bin/bash


echo "Syncing vscode config.."
function rsyncVSCodeConfig() {
  rsync -avh --no-perms \
    "$(dirname "${BASH_SOURCE}")/config/settings.json" \
    "$(dirname "${BASH_SOURCE}")/config/keybindings.json" \
    "$(dirname "${BASH_SOURCE}")/config/snippets" \
    $HOME/Library/Application\ Support/Code/User

  echo -e "Make sure to reboot vsode"
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  rsyncVSCodeConfig
else
  read -p "Update VSCode config files. Are you sure? [Y/n] "
  echo ""
  if [[ ! $REPLY =~ ^[nN]|[nN][oO]$ ]]; then
    rsyncVSCodeConfig
  fi
fi

unset rsyncVSCodeConfig

# To get a list of your installed extensions run: `code --list-extensions`
echo "Install VSCode extensions.."
function installCodeExt() {
  VSCODE_EXT=(
    aaron-bond.better-comments
    alefragnani.project-manager
    apollographql.vscode-apollo
    bierner.markdown-emoji
    bierner.markdown-shiki
    bmewburn.vscode-intelephense-client
    CoenraadS.bracket-pair-colorizer
    csstools.postcss
    deerawan.vscode-faker
    denoland.vscode-deno
    eamodio.gitlens
    EditorConfig.EditorConfig
    esbenp.prettier-vscode
    file-icons.file-icons
    funkyremi.vscode-google-translate
    hangxingliu.vscode-nginx-conf-hint
    jeremyljackson.vs-docblock
    jock.svg
    jspolancor.presentationmode
    mariusschulz.yarn-lock-syntax
    maximus136.change-string-case
    mikestead.dotenv
    msjsdiag.debugger-for-chrome
    octref.vetur
    onecentlin.laravel-blade
    pnp.polacode
    raynigon.nginx-formatter
    redhat.vscode-yaml
    ritwickdey.LiveServer
    snipsnapdev.snipsnap-vscode
    streetsidesoftware.code-spell-checker
    stylelint.vscode-stylelint
    tobiasalthoff.atom-material-theme
    Tyriar.sort-lines
    vitaliymaz.vscode-svg-previewer
    william-voyek.vscode-nginx
    yzhang.markdown-all-in-one
  )
  for i in "${VSCODE_EXT[@]}"; do
    code --install-extension $i
  done
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  installCodeExt
else
  read -p "Are you sure? [Y/n] "
  echo ""
  if [[ ! $REPLY =~ ^[nN]|[nN][oO]$ ]]; then
    if ! command -v code &>/dev/null; then
      echo -e "The VSCode command is not installed \nPlease install it to run the setup for VSCode! \nThen re run this setup script or the vscode/setup script\n"
    else
      installCodeExt
    fi
  fi
fi

unset installCodeExt
