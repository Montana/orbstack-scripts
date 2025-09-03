#!/usr/bin/env bash
set -euo pipefail
export DOCKER_HOST="unix://$HOME/.orbstack/run/docker.sock"
builder_name="${BUILDER_NAME:-orbstack-builder}"
if ! docker buildx inspect "$builder_name" >/dev/null 2>&1; then
  docker buildx create --name "$builder_name" --use
else
  docker buildx use "$builder_name"
fi
docker buildx inspect --bootstrap
docker buildx ls
