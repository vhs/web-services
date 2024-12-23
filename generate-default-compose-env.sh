#!/bin/sh

(
    echo docker-compose.yml
    find services/* -name 'service.*.yml' | grep -v _template
) | tr '\n' ':' | perl -pe 's/:$//g' | awk '{ print "COMPOSE_FILE=" $0 }' >env.default
