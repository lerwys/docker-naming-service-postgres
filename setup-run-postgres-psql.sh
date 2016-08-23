#!/usr/bin/env bash

set -a
set -e
set -u

# Source env vars
. ./env-vars.sh

# Setup postgres
./setup-postgres.sh ${NET_NAME} ${DNS_IP}

# Run postgres
./run-postgres-psql.sh ${NET_NAME} ${DNS_IP}
