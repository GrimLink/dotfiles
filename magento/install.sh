#!/bin/bash

RESET='\033[0m'
GREEN='\033[1;32m'
RED='\033[0;31m'

function StepSection() {
  echo -e "${GREEN}$@${RESET}"
}

# TODO Replace with Mailpit
StepSection "Setup Mailhog"
brew install mailhog

StepSection "Setup Redis"
brew install redis && \
brew services start redis

StepSection "Setup Opensearch"
brew install opensearch && \
brew services start opensearch

if ! command -v valet &> /dev/null; then
  echo "valet not installed, skipping valet actions"
  exit 0
fi

# Set a default php version
valet use php@8.4

# Set common proxy settings
echo "Setting proxy for http://localhost:8025 to mailhog.test"
valet proxy mailhog http://localhost:8025 --secure

echo "Setting proxy for http://localhost:9200 to opensearch.test"
valet proxy opensearch http://localhost:9200 --secure

# Create default folder
DIR_M2="$HOME/Developer/magento"
if [ ! -d "$DIR_M2" ]; then
  mkdir -p $DIR_M2
  valet park $DIR_M2
fi
