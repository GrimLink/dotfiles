# Set some setting
## Include filenames beginning with a "." in the filename expansion.
shopt -s dotglob
## Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;
## Autocorrect typos in path names when using `cd`
shopt -s cdspell;

BASH_SETTINGS=(
  ~/.bash_prompt
  ~/.shell/aliases
  ~/.shell/functions
  ~/.shell/exports
  ~/.shell/magento
  ~/.shell/extra
)

# Load all *.bash files from the ~/.shell folder
for file in ${BASH_SETTINGS[@]}; do
  [ -r "$file" ] && source "$file"
done
unset file
