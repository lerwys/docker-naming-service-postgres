#!/usr/bin/env bash

set -a
set -e
set -u

. ./env-vars.sh

# Create volume container
docker volume create ${NAMING_CONVENTION_DOCKER_VOLUME}
docker create -v ${NAMING_CONVENTION_DOCKER_VOLUME}:/var/lib/postgresql/data --name ${NAMING_CONVENTION_DOCKER_VOLUME} \
    --net ${NET_NAME} --dns ${DNS_IP} postgres:9.5.4 2>/dev/null || true
