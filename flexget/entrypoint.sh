#!/usr/bin/env sh
set -o errexit -o pipefail

LOCK_FILE="/root/.flexget/.config-lock"
[ -f ${LOCK_FILE} ] && rm -f ${LOCK_FILE}

exec flexget "$@"
