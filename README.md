# Dotfiles

_In progress_ 

## Setup

**:warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Using Git and the Setup script

You can clone the repository wherever you want. (I like to keep it in ~/projects/dotfiles.
_You can symlink it to `~/dotfiles`_

```bash
git clone git@github.com:GrimLink/dotfiles.git &&
ln -s ~/Projects/dotfiles ~/dotfiles &&
cd dotfiles &&
source setup.sh
```

The setup script will pull in the latest version and copy the files to your home folder.

Each setup task will first ask if you want to update this piece.

## Insparation and Thanks to…

- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles) for his setup script (named bootstrap.sh)
- [Paul Irish](https://github.com/paulirish/dotfiles) for his bash .aliases and .functions
- Prompt colors inspired on [sindresorhus/pure](https://github.com/sindresorhus/pure)
- Anyone who contributed a patch or made a helpful suggestion
