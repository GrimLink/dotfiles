#!/bin/bash

brew install nvm

mkdir ~/.nvm
nvm alias default system
nvm install --lts

echo "Instaling zsh nvm.."
git clone https://github.com/lukechilds/zsh-nvm.git "$HOME/.zsh/nvm"