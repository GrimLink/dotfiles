#!/bin/bash

brew install node
brew install pnpm

# Setup default config
npm config set depth 0
npm config set init-author-name "GrimLink"
npm config set init-license "MIT"
echo "tag-version-prefix=" > ~/.npmrc
