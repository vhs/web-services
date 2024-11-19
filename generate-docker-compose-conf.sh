#!/usr/bin/env bash

INCLUDE=""
EXCLUDE="_template"

ALL=""
WRITE=""

usage() {
    RET=$1
    shift
    MSGS=("$@")

    echo ""

    if [ "$*" != "" ]; then
        for MSG in "${MSGS[@]}"; do
            echo "ERROR: ${MSG}"
        done
    fi

    echo ""

    echo "USAGE: $(basename "$0") [-w] [-a] [-e pattern]* [-i <compose file>]*"

    echo ""

    echo "Options:"
    printf "  -w\t\t\tWrite output to docker-compose.conf.\n"
    printf "  -a\t\t\tInclude all files.\n"
    printf "  -e <pattern>\t\tSpecify exclude patterns.\n"
    printf "  -i <compose file>\tSpecify compose files to include.\n"
    echo ""

    exit "${RET}"
}

while getopts "awe:i:" ARG; do
    case ${ARG} in
    a)
        ALL="YES"
        ;;
    e)
        EXCLUDE="${EXCLUDE}|${OPTARG}"
        ;;
    i)
        if [ ! -f "${OPTARG}" ]; then
            usage 253 "Compose file ${OPTARG} does not exist"
        else
            INCLUDE="${INCLUDE} ${OPTARG}"
        fi
        ;;
    w)
        WRITE="YES"
        ;;
    *)
        usage 255
        ;;
    esac
done

if [ "${ALL}" != "YES" ]; then
    if [ "${EXCLUDE}" = "" ] || [ "${INCLUDE}" = "" ]; then
        usage 254 "When generating a new file, use -a to explicitly use all files or specify -e or -i arguments to customize."
    fi
fi

if [ -f docker-compose.override.yml ]; then
    INCLUDE="${INCLUDE} docker-compose.override.yml"
fi

OUTPUT=$(
    echo docker-compose.yml
    find services/* -name 'service.*.yml' | sort | grep -v -E "${EXCLUDE}"
    echo "${INCLUDE}" | xargs -r -n 1 echo
)

if [ "${WRITE}" = "YES" ]; then
    echo "${OUTPUT}" | tee docker-compose.conf
else
    echo "${OUTPUT}"
fi
