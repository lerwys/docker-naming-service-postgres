#!/usr/bin/env bash

set -a
set -e
set -u

. ./env-vars.sh

# Run postgres
docker run  --name ${NAMING_CONVENTION_DOCKER_RUN_NAME} --net ${NET_NAME} --dns ${DNS_IP} \
    -p ${POSTGRES_PORT}:${POSTGRES_PORT} -e POSTGRES_USER=${POSTGRES_USER} \
    -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
    -d --volumes-from ${NAMING_CONVENTION_DOCKER_VOLUME} ${NAMING_CONVENTION_DOCKER_ORG_NAME}/${NAMING_CONVENTION_DOCKER_IMAGE_NAME}
