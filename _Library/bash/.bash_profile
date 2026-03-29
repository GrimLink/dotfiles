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

# Load bash prompt
[ -r ~/.bash_prompt ] && source ~/.bash_prompt

# Load all shell files from the ~/.shell folder
for file in ~/.shell/*; do
  [[ -f "$file" && "$file" != *.* ]] && source "$file"
done
unset file
