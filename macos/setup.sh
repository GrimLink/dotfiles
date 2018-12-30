#!/bin/bash

# See full config ~/.macos — https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

source $(dirname "${BASH_SOURCE}")/ui-ux;
source $(dirname "${BASH_SOURCE}")/accessories;
source $(dirname "${BASH_SOURCE}")/finder;
source $(dirname "${BASH_SOURCE}")/dock;
source $(dirname "${BASH_SOURCE}")/safari;
source $(dirname "${BASH_SOURCE}")/spotlight;
