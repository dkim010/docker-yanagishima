#!/bin/bash
set -e

CONF_FILE=/root/app/conf/yanagishima.properties
PARAMS="PRESTO_COORDINATOR_URL CATALOG SCHEMA"

for key in $PARAMS; do
    value=`eval echo "$"$key`
    echo "$key -> $value"
    sed -i -e "s|\${${key}}|${value}|g" ${CONF_FILE}
done

echo 'apply-env completed'
