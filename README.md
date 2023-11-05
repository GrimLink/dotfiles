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
    * macos/install
    * shell/setup
    * bin/setup
    * git/setup
    * git/ssh
    * brew/install
    * zsh/setup
5. Restart your system to let all settings take effect
6. Now you can run the second install script dev-env, using: `./dotfiles/install-dev-env.sh`,
   this will run the following scripts:
    * hyper/setup
    * nvm/install,
      this requires nvm to be installed, I use **fig** for this
    * valet/install
    * valet/setup
    * magento/setup


## What's Inside

Each folder within this repository is accompanied by a detailed README file,
providing insights into the specific configurations and settings it contains.

Feel free to explore and adapt them to suit your development needs.

## Inspirations and Acknowledgments

I'd like to acknowledge the following individuals and projects that have inspired or contributed to the development of these dotfiles:

* [Mathias Bynens' Dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Nicolas Gallagher's Dotfiles](https://github.com/necolas/dotfiles)
* [Paul Irish's Dotfiles](https://github.com/paulirish/dotfiles)
* [Andreas Larsen's Dotfiles](https://github.com/alrra/dotfiles)
* [Sindre Sorhus' Pure Prompt](https://github.com/sindresorhus/pure)
* [Robert Cooper's Blog Article on Zsh Setup with Hyper Terminal](https://www.robertcooper.me/elegant-development-experience-with-zsh-and-hyper-terminal)
* All the contributors who have provided patches and valuable suggestions.

Thank you for exploring my dotfiles. I hope you find them beneficial in enhancing your development environment.
