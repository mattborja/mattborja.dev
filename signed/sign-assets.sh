#!/bin/sh
# Rebuilds MANIFESTSUM.sig from local directory using $PGP_KEY

PGP_KEY="0x33688C2EDC08CD38"
MANIFESTSUM_OUTPUT="./MANIFESTSUM.sig"

find . -type f \
       -not -name ".DS_Store" \
       -not -name "*.sig" \
       | sort \
       | xargs shasum -a 256 \
       | gpg --clearsign --armor --local-user "$PGP_KEY" > "$MANIFESTSUM_OUTPUT"

cat "$MANIFESTSUM_OUTPUT"

echo "To verify, type: gpg -d "$MANIFESTSUM_OUTPUT" | shasum -c"