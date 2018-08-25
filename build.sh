#!/usr/bin/env bash

err() {
    echo "Error: $*" >&2
    exit 1
}

if [[ $( id -u ) -eq 0 ]]; then
    err "Should be runned under user, not root"
fi

docker build \
    --build-arg username=$( id -un ) --build-arg userid=$( id -u ) \
    --build-arg groupname=$( id -gn ) --build-arg groupid=$( id -g ) \
    -t docker-habitat:local .
