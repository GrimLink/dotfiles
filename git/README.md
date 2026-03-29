# Git

## Install

Installs [Fork](https://git-fork.com), a GUI git client.

```sh
./git/install.sh
```

## Setup

Configures global git settings, including username and email.

```sh
./git/setup.sh
```

## Config

All non-personal config settings I like for git.

## Ignore (Global)

Contains all gitignore rules for global use cases.

e.g. system files like `.DS_Store`

For more information about this approach see the [git doc](https://help.github.com/articles/ignoring-files/#create-a-global-gitignore)

## SSH

The ssh script will setup a new ssh key.

I prefer to always setup a new key when doing a fresh install.

> :warning: Don't run this script if you already have one, since it will override it.
