# Bin tools

Some shell commands that I have made.

## create-project

My power house bin script,
that allows you to create a project with minimal effort.

[For more info on create-project, checkout the git repo.](https://github.com/GrimLink/create-project)

## mage

Alias & helper for bin/magento commands

[For more info on mage, checkout the git repo.](https://github.com/GrimLink/mage)

## copydot

Copies formating files to your current folder.

For what it can do run `copydot help`

## Git

All git prefixed scripts can also run as a native git command.

So instead of `git-new` you can also run `git new`.

### New `git-new`

Does all the steps needed to setup a new git project.

### Upstream `git-upsteam`

Does all the steps needed to update a forked git project with the original.

This script has 2 params which both are semi required.
If not filled in the script will ask for it.

### To Main `git-to-main`

Converts a repo default branch from master to main.

Or fetches all changes from a repo that has changed from master to main.

For converting simply run this command in your repo and follow the steps.

To fetch run this command with the flag `--fetch`.

> :warning: make sure you can run this.
> Since this script will remove your master branch!
