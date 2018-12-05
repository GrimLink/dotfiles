# Bash
![Version](https://img.shields.io/badge/version-v1.0.0-green.svg?style=flat-square)

All files are loaded via the [.bash_profile](https://github.com/GrimLink/dotfiles/blob/master/.bash_profile).

This includes:
- Extra _See [custom commands section](#add-custom-commands-without-creating-a-new-fork)_
- Prompt _the feel and look of the Terminal_
- Export _export path sets, example brew composer path_
- Aliases
- Functions
- Magento _Aliases/Functions specific to Magento2 and magerun_

_All files are prefixed with bash, similar to prompt_

## Add custom commands without creating a new fork

If `~/.bash/bash_extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My bash_extra includes (for example) the setup for the git config.

```bash
GIT_AUTHOR_NAME="GrimLink"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="Some@cool.email"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use bash_extra to override settings, functions and aliases from my dotfiles repository. It’s probably better to fork this repository instead, though.
