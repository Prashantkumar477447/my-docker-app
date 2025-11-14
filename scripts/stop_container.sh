#!/bin/bash
set -e
# Stop and remove existing container if present
if docker ps -a --format '{{.Names}}' | grep -q '^my-docker-app$'; then
docker stop my-docker-app || true
docker rm my-docker-app || true
fi
