#!/usr/bin/env bash

set -a
set -e
set -u

NET_NAME="$1"
DNS_IP="$2"
POSTGRES_PORT="$3"
POSTGRES_USER="$4"
POSTGRES_PASSWORD="$5"

# Run postgres
docker run  --name naming-service-postgres --net ${NET_NAME} --dns ${DNS_IP} \
    -p ${POSTGRES_PORT}:${POSTGRES_PORT} -e POSTGRES_USER=${POSTGRES_USER} \
    -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
    -d --volumes-from naming-service-postgres-volume postgres
