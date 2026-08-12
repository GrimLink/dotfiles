#!/bin/sh
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
model=$(echo "$input" | jq -r '.model.display_name // empty')
repo=$(echo "$input" | jq -r '.workspace.repo | if . then .owner + "/" + .name else empty end')
branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Shorten home directory
home="$HOME"
short_cwd="${cwd/#$home/~}"

parts=""

# Directory
parts="$short_cwd"

# Git branch
if [ -n "$branch" ]; then
  parts="$parts  $branch"
fi

# Repo
if [ -n "$repo" ] && [ -z "$branch" ]; then
  parts="$parts  $repo"
fi

# Model
if [ -n "$model" ]; then
  parts="$parts  $model"
fi

# Context usage
if [ -n "$used" ]; then
  parts="$parts  ctx:$(printf '%.0f' "$used")%%"
fi

printf '%s' "$parts"
