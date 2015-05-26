#!/bin/bash

SATIS=$1
CONFIG_PATH=$2
OUT_PATH=$3

if [ -z "$SATIS" ] || [ -z "$CONFIG_PATH" ] || [ -z "$OUT_PATH" ]; then
    >&2 echo "run.sh <path to satis script> <path to config.json> <output path>"
    exit 1
fi

php $SATIS build --verbose $CONFIG_PATH $OUT_PATH

if [ $? == 0 ]; then
	aws s3 cp --acl public-read --recursive $OUT_PATH s3://$S3_BUCKET/$S3_PATH
fi