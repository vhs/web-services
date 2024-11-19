#!/bin/bash

cd "$(dirname "$(realpath "$0")")" || exit 255

echo "Deploy script"
echo ""

docker compose up -d
