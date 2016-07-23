#!/bin/bash
set -e

sed -ri "s|PASSWORD|${PASSWORD}|" ${CONFIG_FILE}

/usr/bin/ss-server -c ${CONFILE_FILE} -u --fast-open
