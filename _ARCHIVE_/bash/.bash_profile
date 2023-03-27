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
# Do not autocomplete hidden files
# unless the pattern explicitly begins with a dot
set match-hidden-files off

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
