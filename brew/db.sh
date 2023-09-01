#!/bin/bash

brew install redis && \
brew services start redis

brew install opensearch && \
brew services start opensearch

# Utilities
brew install --cask dbngin
brew install --cask tableplus
brew install --cask sequel-ace
