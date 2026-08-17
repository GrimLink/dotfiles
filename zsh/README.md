# ZSH

This contains all the config I have used for my zsh setup.

## Install

Installs the Pure prompt theme and zsh-syntax-highlighting, then copies
`.zshrc` to `~/.zshrc`.

```sh
./zsh/install.sh
```

## Setup

There is no setup script, on purpose.

Copying `.zshrc` happens once, when setting up a new mac. After that `~/.zshrc`
is yours to manage by hand, because other scripts append to it
(`valet/install.sh` adds `NODE_EXTRA_CA_CERTS`, `node/nvm.sh` adds the auto
switch hook). A repeatable sync would overwrite the file and drop those lines,
which is why zsh is absent from `sync-settings.sh`.

Everything the other scripts append lands below the `zsh-syntax-highlighting`
block at the end, so only the part above it needs to stay in step with this
repo.

## Keybindings

By default on macOS the terminal allows you to use `⌘ + →` to go to the end.
And `⌘ + ←` to go to the start.

This feature in not by default in zsh setup so I have added these keybindings.

## Shell

The shell options,
like aliases are are found under [the shell folder](../README,md).

These options are not bound to which shell you are using.
