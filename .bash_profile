# Load our dotfiles like ~/.prompt, etc…
# bash_extra can be used for settings you don’t want to commit,
# Use it to configure your PATH, thus it being first in line.
for file in ~/.bash/.{exports,aliases,functions,prompt,extra}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;
