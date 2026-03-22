#!/bin/bash

brew install php
brew install composer

# Set COMPOSER_HOME and PATH based on the installed version
COMPOSER_HOME_PATH=$(composer config --global home 2>/dev/null)
if [ -n "$COMPOSER_HOME_PATH" ]; then
  echo "export COMPOSER_HOME=\"$COMPOSER_HOME_PATH\"" >> ~/.shell/extra
  echo "export PATH=\"$COMPOSER_HOME_PATH/vendor/bin:\$PATH\"" >> ~/.shell/extra
fi
