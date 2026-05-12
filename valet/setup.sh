#!/bin/bash

# Define the source template path relative to the script location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$SCRIPT_DIR/php-conf-templates"

echo "Setting up PHP configuration templates..."

# Find Homebrew prefix
BREW_PREFIX=$(brew --prefix)
PHP_ETC_DIR="$BREW_PREFIX/etc/php"

if [[ -d "$PHP_ETC_DIR" ]] && [[ -d "$TEMPLATE_DIR" ]]; then
  for ini_src in "$TEMPLATE_DIR"/*.ini; do
    [ -e "$ini_src" ] || continue
    ini_name=$(basename "$ini_src")

    for php_dir in "$PHP_ETC_DIR"/*; do
      if [[ -d "$php_dir/conf.d" ]]; then
        php_version=$(basename "$php_dir")
        # Prefix with zz- to ensure it loads last
        target_ini="$php_dir/conf.d/zz-$ini_name"

        # Always update the file to ensure the path is correct
        echo "Syncing $ini_name for PHP $php_version..."
        sed "s|<homebrew_path>|$BREW_PREFIX|g" "$ini_src" > "$target_ini"
      fi
    done
  done
fi

if command -v valet &> /dev/null; then
  echo "Restarting Valet services..."
  valet restart
fi
