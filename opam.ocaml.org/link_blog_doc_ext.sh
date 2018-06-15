#!/bin/sh

set -ex

BLOG=$1
DOC=$2
EXT=$3

ln -n -s -f "$BLOG" blog
ln -n -s -f "$DOC" doc
ln -n -s -f "$EXT" ext
