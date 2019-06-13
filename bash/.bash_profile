# Make Tab autocomplete regardless of filename case
set completion-ignore-case on

# List all matches in case multiple possible completions are possible
set show-all-if-ambiguous on

# Include filenames beginning with a "." in the filename expansion.
shopt -s dotglob

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Do not autocomplete hidden files unless the pattern explicitly begins with a dot
set match-hidden-files off

# Detect which `ls` flavor is in use
if ls --color >/dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
  export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
  colorflag="-G"
  export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

alias ls="command ls ${colorflag}"

# Load all shell files from the ~/.shell folder
LOAD_SETTINGS=(
  ~/.bash_prompt
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
source "/usr/local/opt/nvm/nvm.sh"
# Load nvm bash_completion
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] &&
source "/usr/local/opt/nvm/etc/bash_completion"
