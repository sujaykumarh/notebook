#!/bin/sh

# Build Hugo Project

echo "🔨 Building Hugo Site"

## Hugo Options used for building the site
# -d                        dist directory
# -gc                       run some cleanup tasks (remove unused cache files) after the build
# --minify                  minify the output
# --cleanDestinationDir     remove files from destination not found in static directories
# -v                        verbose mode

EXTRA_PARAMS=$@

echo "EXTRA_PARAMS: $EXTRA_PARAMS"
CURRENT_USER="$(id -u):$(id -g)" docker compose run --rm hugo build --minify --disableKinds=RSS --gc -v --cleanDestinationDir -d dist $EXTRA_PARAMS
echo "✅ build complete"
