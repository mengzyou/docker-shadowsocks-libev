#!/bin/bash
set -e

if [[ "$1" = "start" ]]; then
  if [[ "${PASSWORD}" ]]; then
    sed -ri "s|\"password\":.*|\"password\": \"${PASSWORD}\",|" ${CONFIG_FILE}
  fi
  set -- gosu root ss-server -c ${CONFIG_FILE} -u --fast-open
fi

exec "$@"

