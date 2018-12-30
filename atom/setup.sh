#!/bin/bash

# Install all extensions
if ! command -v apm &> /dev/null; then
  apm stars --user GrimLink --install
fi

# Sync config
# TODO
