#!/bin/bash
set -e

SEDARG="-i 's/%PASSWORD%/$PASSWORD/' $CONFIG_FILE"
eval sed $SEDARG

$SSSERVER -c /etc/shadowsocks/shadowsocks-libev-config.json -u --fast-open
