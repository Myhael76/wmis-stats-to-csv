#!/bin/sh

# Assume all zips in the same folder unpack different filenames
# shellcheck disable=SC2156
find . -name '*.zip' -exec sh -c 'unzip -d `dirname {}` {}' ';'