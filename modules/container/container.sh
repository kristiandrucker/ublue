#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -euo pipefail

get_json_array PRIVILEGED 'try .["privileged"]' "$1"
get_json_array USER 'try .["user"]' "$1"

if [ "$PRIVILEGED" = "true" ]; then
    echo "Generating system quadlet containers"
    /usr/libexec/podman/quadlet /usr/lib/systemd/system
fi

if [ "$USER" = "true" ]; then
    echo "ERROR: Not yet supported..."
    exit 1
fi
