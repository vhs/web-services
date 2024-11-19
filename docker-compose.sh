#!/bin/bash

COMPOSE_FILE=$(grep -v -E '^(#|$)' docker-compose.conf | xargs | tr ' ' ':') docker compose "$@"
