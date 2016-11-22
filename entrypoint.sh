#!/bin/bash
set -e

sed -ri "s|PASSWORD|${PASSWORD}|" ${CONFIG_FILE}

if [[ $1 == "start" ]]; then
  /usr/bin/ss-server -c ${CONFIG_FILE} -u --fast-open
else
  exec $@
fi
