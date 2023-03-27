#!/bin/bash

echo "Setting proxy for http://localhost:8025 to mailhog.test"
valet proxy mailhog http://localhost:8025 --secure

echo "Setting proxy for http://localhost:9200 to opensearch.test"
valet proxy opensearch http://localhost:9200 --secure