#!/usr/bin/env bash

set -a
set -e
set -u

NET_NAME="$1"
DNS_IP="$2"

# Run postgres
docker run --name naming-service-postgres-psql --net ${NET_NAME} --dns ${DNS_IP} \
    -it postgres psql -h naming-service-postgres -U naming-service-postgres
