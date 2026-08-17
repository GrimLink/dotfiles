#!/bin/bash

brew install node
brew install pnpm

# Trust first, Homebrew refuses to load a formula from a non official tap
# until it is. The qualified name taps nubjs/tap on the way in.
brew trust --formula nubjs/tap/nub
brew install nubjs/tap/nub

# Setup default config
npm config set depth 0
npm config set init-author-name "GrimLink"
npm config set init-license "MIT"
npm config set init-type "module"
npm config set min-release-age 3
npm config set ignore-scripts true
npm config set allow-git root

echo "tag-version-prefix=" > ~/.npmrc
