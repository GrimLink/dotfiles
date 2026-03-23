# Dotfiles: Developer's Setup

My personal developer setup for macOS, covering shell configuration, git, Laravel Valet, and more.

> :warning: These dotfiles are configured to match my personal preferences.
> Understand the code before running any scripts.

## Getting Started

1. [Download the repository as a zip archive](https://github.com/GrimLink/dotfiles/archive/refs/heads/main.zip)
2. Move this to your preferred location. I typically use `mv $HOME/Downloads/dotfiles-main $HOME/dotfiles`
3. Make sure you're in your home folder, e.g. `~` or `$HOME`
4. Run `./dotfiles/install-system.sh`
5. Restart your system to let all settings take effect
6. Run `./dotfiles/install-dev-env.sh`


## What's Inside

Each folder within this repository is accompanied by a detailed README file,
providing insights into the specific configurations and settings it contains.

Feel free to explore and adapt them to suit your development needs.

### install-system.sh

- macOS system settings
- Shell, bin, and git configuration
- [Homebrew](https://brew.sh) with node, php, composer, and common dev tools
- [Zsh](https://zsh.org) with [Pure](https://github.com/sindresorhus/pure) prompt
- [Ghostty](https://ghostty.org) terminal
- [Zed](https://zed.dev) editor
- [Fork](https://git-fork.com) git client
- [Claude Code](https://claude.ai/claude-code) and [Gemini CLI](https://developers.google.com/gemini-code-assist)

### install-dev-env.sh

- [NVM](https://github.com/nvm-sh/nvm) for Node version management
- [Laravel Valet](https://laravel.com/docs/valet) with MySQL 8.4
- [Magento2](https://developer.adobe.com/open/magento) tools (Mailhog, Redis, Opensearch, n98-magerun2, mage)

### _Library

Alternative configurations for tools not in the main setup (bash, VSCode, WezTerm). Each has a `setup.sh` to apply the settings, but you need to install the tool yourself.

### _Archive

Configurations kept for historical reference only. These tools are no longer actively maintained.

## Inspirations and Acknowledgments

I'd like to acknowledge the following individuals and projects that have inspired or contributed to the development of these dotfiles:

- [Mathias Bynens' Dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Paul Irish's Dotfiles](https://github.com/paulirish/dotfiles)
- [Andreas Larsen's Dotfiles](https://github.com/alrra/dotfiles)
- [Freek Van der Herten's Dotfiles](https://github.com/freekmurze/dotfiles)
- All the contributors who have provided patches and valuable suggestions.

Thank you for exploring my dotfiles. I hope you find them beneficial in enhancing your development environment.
