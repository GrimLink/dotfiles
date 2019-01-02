#!/bin/bash

# Install all extensions
if command -v apm &> /dev/null; then
  apm stars --user GrimLink --install
else
  echo "apm cli missing";
fi

# Sync config
# TODO
