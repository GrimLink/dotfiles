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

## GitHub CLI

`gh` comes from the Brewfile. It targets `github.com` by default, so a single
login covers everything.

```sh
gh auth login
```

## GitLab CLI

`glab` comes from the Brewfile. Every instance needs its own login, since a
self-managed host keeps a separate token.

```sh
cd ~ && glab auth login --hostname gitlab.example.com
```

A self-managed host also asks for the API hostname and the SSH hostname. Answer
both with the instance host itself, an empty answer is refused.

The SSH answer prefills from the SSH remote of the current repo, hence the `cd`.
Run it inside a GitHub checkout and it prefills `github.com`.

Inside a repo `glab` reads the host from the remote. Outside one it uses the
global `host` setting, override per command with `GITLAB_HOST`.

Config lives in `~/Library/Application Support/glab-cli/config.yml`. Tokens land
in the keychain, and that file can hold plaintext tokens for hosts that skip the
keyring, so it stays out of this repo.
