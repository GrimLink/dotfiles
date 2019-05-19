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

# Load all bash files from the ~/.shell folder
BASH_SETTINGS=(
  ~/.shell/prompt
  ~/.shell/aliases
  ~/.shell/functions
  ~/.shell/exports
  ~/.shell/applications
  ~/.shell/extra
)

for file in ${BASH_SETTINGS[@]}; do
  [ -r "$file" ] && source "$file"
done
unset file
