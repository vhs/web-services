#!/bin/bash

SCRIPTDIR="$(
    cd $(dirname $0)/$(if [ "$(find $0 -type l)" != "" ]; then dirname $(find $0 -printf '%l'); fi)
    pwd
)"
cd $SCRIPTDIR

echo "Deploy script"
echo ""

/usr/local/bin/docker-compose up -d
