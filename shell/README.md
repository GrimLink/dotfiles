# Bash

All files are loaded via the terminal shell of choice.
In this dotfile this is bash or zsh.

## Whats in the box

### Export

Default export path sets are set here.
E.g. local bin, composer.

### Aliases

Set of handy aliases for common commands.

This includes;

* Short navigate `..` instead `cd ..`
* ls commands
* system, e.g. ip, show/hide dotfiles.
* more..

_The `helpme` script will show all possible commands found here_

### Functions

Set of handy aliases for common commands.

This includes;

* ..

### Applications

Same as the aliases and functions but specific for some applications.

## Add custom commands without creating a new fork

If `~/.shell/extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

You could also use extra to override settings, functions and aliases from my dotfiles repository. It’s probably better to fork this repository instead, though.

## Need help or forgot a command

If the bin command shell-help is installed.
then you can view all commands by running `shell-help`.
