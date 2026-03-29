---
Site: 
Updated: 2026-03-30
---


# Bin tools

Some shell commands that I have made.

## Setup

Syncs all bin scripts to `~/bin/`.

```sh
./bin/setup.sh
```

## add-editorconfig

Creates an editorconfig based on the type of project.

## Git

All git prefixed scripts can also run as a native git command.

So instead of `git-new` you can also run `git new`.

### New `git-new`

Initialises a new git repo, commits all files, and pushes to a remote origin.

```sh
git new <url>
```

### Upstream `git-upstream`

Adds a named remote for a forked or related repository. The name defaults to the username or organisation from the URL.

```sh
git upstream <url> [name]
```

