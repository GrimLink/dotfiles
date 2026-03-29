---
Site: 
Updated: 2026-03-30
---

# Bash

All files are loaded via the terminal shell of choice.
In this dotfile repo this is bash or zsh.

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

### Functions

Set of handy functions for common tasks.

This includes;

* Navigate up multiple directories `..`
* Create folder and enter it `mcd`
* Find files/folders `f`
* Convert images to `.webp` with `to-webp`
* NVM auto-switch via `load-nvmrc` (reads `.nvmrc` on directory change)
* Node utilities: `node-find`, `node-clean`

## Add custom commands without creating a new fork

If `~/.shell/extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

You could also use extra to override settings, functions and aliases from my dotfiles repository. It’s probably better to fork this repository instead, though.
