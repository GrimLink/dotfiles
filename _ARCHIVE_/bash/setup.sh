#!/bin/bash

rsync -avh --no-perms \
  "$(dirname "${BASH_SOURCE}")/.bash_profile" \
  "$(dirname "${BASH_SOURCE}")/.bash_prompt" ~