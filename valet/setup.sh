#!/bin/bash

if ! command -v valet &> /dev/null; then
  echo "valet not installed"
  exit 1;
fi

# Set common proxy settings
echo "Setting proxy for http://localhost:8025 to mailhog.test"
valet proxy mailhog http://localhost:8025 --secure

echo "Setting proxy for http://localhost:9200 to opensearch.test"
valet proxy opensearch http://localhost:9200 --secure

# Create some default folders
DIR_BASE="$HOME/Developer"

DIR_M2="$DIR_BASE/magento"
if [ -d "$DIR_M2" ]; then
  mkdir -p $DIR_M2
  valet park $DIR_M2
fi

DIR_WP="$DIR_BASE/wordpress"
if [ -d "$DIR_WP" ]; then
  mkdir -p $DIR_WP
  valet park $DIR_WP
fi
