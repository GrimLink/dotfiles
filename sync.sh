#!/bin/bash

# Go to dotfile
cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

# If it has the flag `--force` or `-f`.
# Then don't ask for each task
source shell/setup.sh;
source bin/setup.sh;

source git/setup.sh;

source node/setup.sh;

source vscode/extensions.sh;
source vscode/config.sh;

source hyper/setup.sh;
