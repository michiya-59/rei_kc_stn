#!/bin/bash
set -e

rm -f /rei_kc_stn/tmp/pids/server.pid

exec "$@"

