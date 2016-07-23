#!/bin/bash
set -e

sed -ri "s|PASSWORD|${PASSWORD}|" ${CONFIG_FILE}

/usr/bin/ss-server -c ${CONFIG_FILE} -u --fast-open
