#!/bin/bash

brew install node
brew install pnpm

# Setup default config
npm config set depth 0
npm config set init-author-name "GrimLink"
npm config set init-license "MIT"
npm config set init-type "module"
npm config set min-release-age 3
npm config set ignore-scripts true

echo "tag-version-prefix=" > ~/.npmrc
