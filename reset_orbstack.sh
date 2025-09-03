#!/usr/bin/env bash
set -euo pipefail
export DOCKER_HOST="unix://$HOME/.orbstack/run/docker.sock"
nuke="${NUKE:-false}"
docker ps -q | xargs -r docker stop
docker ps -aq | xargs -r docker rm -f
if [[ "$nuke" == "true" ]]; then
  docker images -q | xargs -r docker rmi -f
  docker volume ls -q | xargs -r docker volume rm -f
  docker builder prune -af || true
fi
