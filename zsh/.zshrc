# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Shares history across multiple zsh sessions
setopt SHARE_HISTORY

# Expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST

# Do not store duplications, keep newest
setopt HIST_IGNORE_ALL_DUPS

# Ignore duplicates when searching
setopt HIST_FIND_NO_DUPS

# Removes blank lines from history
setopt HIST_REDUCE_BLANKS

# Add missing Mac cmd key bindings.
bindkey "^[OH" beginning-of-line # ⌘ + left arrow
bindkey "^[OF" end-of-line       # ⌘ + right arrow

# Move trouch history using the up/down arrow keys
# Also with a already entered command search
bindkey $'^[[A' up-line-or-search   # up arrow
bindkey $'^[[B' down-line-or-search # down arrow

# autocomplete case insensitive
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# list with colors
zstyle ':completion:*' list-colors ''x

# load completion
autoload -Uz compinit && compinit

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

# Load nvm
NVM_LAZY_LOAD=true
NVM_AUTO_USE=true
fpath+=$HOME/.zsh/nvm/zsh-nvm.plugin.zsh

# Load zsh-syntax-highlighting
# I need to be last in this file to work
fpath+=$HOME/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh
