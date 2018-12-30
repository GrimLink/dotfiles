# Dotfiles

My setup for Bash, Node, Git, OSX, Editors and more...

> :warning: These are my personal settings.
> Don't run the scripts without understanding what the code does.

## Setup

You can clone the repository wherever you want.

_I like to keep it in `~/dotfiles`._

```bash
bash -c "$(curl -LsS https://raw.githubusercontent.com/GrimLink/dotfiles/master/get.sh)"
```

## Install

If it is your first install.
Run the `install.sh` script.
You can simply `source` it or make it executable.

```bash
source ~/projects/dotfiles/install.sh
```

Follow the steps for each script, that is called via the install script.

_Use the flag `--force` to skip the questions for each config_

## Sync

`sync.sh` updates the dotfiles and resync the config files.

Unlike the install this does not reinstall apps and other static assest.

_Use the flag `--force` to skip the questions for each config_

## Insparation and Thanks to…

- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [necolas/dotfiles](https://github.com/necolas/dotfiles)
- [paulirish/dotfiles](https://github.com/paulirish/dotfiles)
- [alrra/dotfiles](https://github.com/alrra/dotfiles)
- [sindresorhus/pure](https://github.com/sindresorhus/pure)
- Anyone who contributed a patch or made a helpful suggestion
