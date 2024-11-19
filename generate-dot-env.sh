#!/bin/sh

(
    echo "COMPOSE_FILE=$(grep -v -E '^(#|$)' docker-compose.conf | xargs | tr ' ' ':')"
) >.env
