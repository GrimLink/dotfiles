# Dotfiles: Developer's Setup

Welcome to my developer setup dotfiles repository.

Here, you'll find a curated collection of configurations and settings tailored to enhance your development environment.

This repository encompasses various aspects, including Shell configurations, MacOS settings, Laravel Valet setup, and more.

> :warning: Please exercise caution when using these dotfiles.
>
> They are configured to match my personal preferences,
> and it's crucial to understand the code before executing any scripts to avoid unintended consequences.

## Getting Started

To get started, follow the following steps:

1. [Download the repository as a zip archive](https://github.com/GrimLink/dotfiles/archive/refs/heads/main.zip)
2. Move this to your preferred location. I typically use `mv $HOME/Downloads/dotfiles-main $HOME/dotfiles`
3. Make sure your in your root user folder, e.g. `~` or `$HOME`
4. First run the system script, using: `./dotfiles/install-system.sh`,
   this will run the following scripts:
    - [macos/install](./macos/)
    - [bin/setup](./bin/)
    - [shell/setup](./shell/)
    - [brew/install](./brew/)
    - [git/setup](./git/)
    - [git/ssh](./git/)
    - [git/install](./git/)
    - [zsh/install](./zsh/)
    - [zsh/setup](./zsh/)
    - [ghostty/install](./ghostty/)
    - [zed/install](./zed/)
    - [claude/install](./claude/)
    - [claude/setup](./claude/)
    - [gemini/install](./gemini/)
    - [gemini/setup](./gemini/)
5. Restart your system to let all settings take effect
6. Now you can run the second install script dev-env, using: `./dotfiles/install-dev-env.sh`,
   this will run the following scripts:
    - [ghostty/setup](./ghostty/)
    - [zed/setup](./zed/)
    - [nvm/install](./nvm/)
    - [valet/install](./valet/)
    - [valet/setup](./valet/)
    - [magento/install](./magento/)
    - [magento/setup](./magento/)


## What's Inside

Each folder within this repository is accompanied by a detailed README file,
providing insights into the specific configurations and settings it contains.

Feel free to explore and adapt them to suit your development needs.

## Inspirations and Acknowledgments

I'd like to acknowledge the following individuals and projects that have inspired or contributed to the development of these dotfiles:

- [Mathias Bynens' Dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Paul Irish's Dotfiles](https://github.com/paulirish/dotfiles)
- [Andreas Larsen's Dotfiles](https://github.com/alrra/dotfiles)
- [Freek Van der Herten's Dotfiles](https://github.com/freekmurze/dotfiles)
- [Sindre Sorhus' Pure Prompt](https://github.com/sindresorhus/pure)
- All the contributors who have provided patches and valuable suggestions.

Thank you for exploring my dotfiles. I hope you find them beneficial in enhancing your development environment.
