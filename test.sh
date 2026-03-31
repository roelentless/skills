#!/bin/sh
# Development smoke tests — verifies each config is accepted by its package manager.
# Run these when changing the skill, not on user systems.

set -e

echo "=== npm ==="
docker run --rm node:22-alpine sh -c "
  echo 'min-release-age=7' >> ~/.npmrc &&
  npm config get min-release-age"

echo "=== uv ==="
docker run --rm python:3.12-alpine sh -c "
  pip install uv --quiet &&
  mkdir -p ~/.config/uv &&
  echo 'exclude-newer = \"7 days\"' > ~/.config/uv/uv.toml &&
  cat ~/.config/uv/uv.toml"

echo "=== pnpm ==="
docker run --rm node:22-alpine sh -c "
  npm install -g pnpm &&
  pnpm config set minimum-release-age 10080 &&
  pnpm config get minimum-release-age"

echo "=== bun ==="
docker run --rm oven/bun:alpine sh -c "
  printf '[install]\nminimumReleaseAge = 604800\n' > ~/.bunfig.toml &&
  cat ~/.bunfig.toml"

echo "=== yarn ==="
docker run --rm node:22-alpine sh -c "
  corepack enable &&
  corepack prepare yarn@4 --activate &&
  mkdir /test && cd /test &&
  YVER=\$(yarn --version) &&
  echo \"{\\\"packageManager\\\":\\\"yarn@\$YVER\\\"}\" > package.json &&
  touch yarn.lock &&
  echo 'npmMinimalAgeGate: \"7d\"' > ~/.yarnrc.yml &&
  yarn config get npmMinimalAgeGate"

echo "all tests passed"
