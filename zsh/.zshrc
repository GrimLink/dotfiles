# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Add missing Mac cmd key bindings
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line

# Set theme to Prompt theme
# https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
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

# Load zsh-syntax-highlighting
ZSH_SYNTAX_DIR="/usr/local/share/zsh-syntax-highlighting"
[ -s "${ZSH_SYNTAX_DIR}/zsh-syntax-highlighting.zsh" ] && . "${ZSH_SYNTAX_DIR}/zsh-syntax-highlighting.zsh"
