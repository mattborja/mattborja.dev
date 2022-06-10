#!/bin/sh
# Rebuilds MANIFESTSUM.sig from local directory using $PGP_KEY

PGP_KEY="0x33688C2EDC08CD38"

find . -type f \
       -not -name ".DS_Store" \
       -not -name "*.sig" \
       | sort | gpg --clearsign --armor --local-user "$PGP_KEY" > MANIFESTSUM.sig

cat MANIFESTSUM.sig
