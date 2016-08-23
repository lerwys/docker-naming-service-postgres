#!/usr/bin/env bash

set -a
set -e
set -u

NET_NAME="$1"
DNS_IP="$2"

# Create volume container
docker create -v /var/lib/postgresql/data --name naming-service-postgres-volume \
    --net ${NET_NAME} --dns ${DNS_IP} postgres
