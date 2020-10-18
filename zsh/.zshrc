# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Add missing Mac cmd key bindings
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line

# Set theme to Prompt theme
# https://github.com/sindresorhus/pure
fpath+=$HOME/.zsh/pure
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

# Quick access to the .zshrc file
alias zshrc='${=EDITOR} $HOME/.zshrc'

# Load nvm
NVM_COMPLETION=true
NVM_LAZY_LOAD=true
NVM_AUTO_USE=true
[ -s "$HOME/.zsh/nvm/zsh-nvm.plugin.zsh" ] && . "$HOME/.zsh/nvm/zsh-nvm.plugin.zsh"

# Load zsh-syntax-highlighting
# I need to be last in this file to work
[ -s "$HOME/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh" ] && . "$HOME/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh"
