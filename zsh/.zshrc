# Prompt theme
# https://github.com/sindresorhus/pure
autoload -U promptinit
promptinit
prompt pure

# Uses the zsh precmd function hook to set the tab title
# to the current working directory before each prompt
function precmd () {
    window_title="\\033]0;${PWD##*/}\\007"
    echo -ne "$window_title"
}

# Load all shell files from the ~/.shell folder
LOAD_SETTINGS=(
  ~/.shell/aliases
  ~/.shell/functions
  ~/.shell/exports
  ~/.shell/applications
  ~/.shell/extra
)

for file in ${LOAD_SETTINGS[@]}; do
  [ -r "$file" ] && source "$file"
done
unset file

export NVM_DIR="$HOME/.nvm"
# Loads nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] &&
. "/usr/local/opt/nvm/nvm.sh"
# Load nvm bash_completion
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] &&
. "/usr/local/opt/nvm/etc/bash_completion"
# Load zsh-syntax-highlighting
[ -s "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] &&
. "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
