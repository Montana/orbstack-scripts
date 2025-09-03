#!/usr/bin/env bash
set -euo pipefail
export DOCKER_HOST="unix://$HOME/.orbstack/run/docker.sock"
docker version
docker info
