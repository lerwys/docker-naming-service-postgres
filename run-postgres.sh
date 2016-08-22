#!/usr/bin/env bash

set -a
set -e
set -u

NET_NAME="$1"
DNS_IP="$2"

POSTGRES_PORT=5432

# Run postgres
docker run  --name naming-service-postgres --net ${NET_NAME} --dns ${DNS_IP} \
    -p ${POSTGRES_PORT}:${POSTGRES_PORT} -e POSTGRES_PASSWORD=mysecretpassword \
    -d postgres
