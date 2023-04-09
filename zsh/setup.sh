#!/bin/bash

rsync -avh --no-perms "$(dirname "${BASH_SOURCE}")/.zshrc" ~
