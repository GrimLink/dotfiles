#!/bin/bash

# TODO: Document all remove steps needed
# Removes the valet+ installation
valet uninstall
# TODO: Look for valet specific brew steps
# brew services stop
# brew uninstall
rm -rf ~/.valet
rm /usr/local/bin/valet
