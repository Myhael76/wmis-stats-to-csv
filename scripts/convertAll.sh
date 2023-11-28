#!/bin/sh

# shellcheck disable=SC2156
find /mnt/data -type f -name "stats*.log" -exec sh -c '/mnt/scripts/convert.sh {}' ';'