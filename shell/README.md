# Bash

All files are loaded via the [.bash_profile](https://github.com/GrimLink/dotfiles/blob/master/.bash_profile).

This includes:
- Extra _See [custom commands section](#add-custom-commands-without-creating-a-new-fork)_
- Prompt _the feel and look of the Terminal_
- Export _export path sets, example brew composer path_
- Aliases
- Functions
- Applications

## Add custom commands without creating a new fork

If `~/.shell/extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

You could also use extra to override settings, functions and aliases from my dotfiles repository. It’s probably better to fork this repository instead, though.
