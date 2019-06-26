#!/bin/bash

# Setup file for nvm
# Not sure if I am going to use this

# Probly wil install via curl
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# Create nvm folder
mkdir ~/.nvm

touch ~/.nvm/default-packages
echo grunt-cli >> ~/.nvm/default-packages
echo gulp-cli >> ~/.nvm/default-packages

if command -v nvm &>/dev/null; then
  # Set default to system node version
  nvm alias default system

  # Install only LTS version
  nvm install --lts
else
  echo "Skipping.. NVM is not installed"
fi

# ADD nvm + auto swither to zshrc
echo 'export NVM_DIR="$HOME/.nvm"
# Set nvm but dont load (speeds up boot terminal time)
[ -s "/usr/local/opt/nvm/nvm.sh" ] &&
. "/usr/local/opt/nvm/nvm.sh" --no-use
# Load nvm bash_completion
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] &&
. "/usr/local/opt/nvm/etc/bash_completion"

# Automatically switch node versions when a directory has a `.nvmrc` file
autoload -U add-zsh-hook
# Zsh hook function
load-nvmrc() {
    local node_version="$(nvm version)" # Current node version
    local nvmrc_path="$(nvm_find_nvmrc)" # Path to the .nvmrc file

    # Check if there exists a .nvmrc file
    if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    # Check if the node version in .nvmrc is installed on the computer
    if [ "$nvmrc_node_version" = "N/A" ]; then
        # Install the node version in .nvmrc on the computer and switch to that node version
        nvm install
    # Check if the current node version matches the version in .nvmrc
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
        # Switch node versions
        nvm use
    fi
    # If there isnt an .nvmrc make sure to set the current node version to the default node version
    elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
    fi
}
# Add the above function when the present working directory (pwd) changes
add-zsh-hook chpwd load-nvmrc
load-nvmrc' >> ~/zshrc
