#!/bin/sh
# Verifies origin of MANIFESTSUM.sig used in subsequent SHA2 verification of tracked files

MANIFESTSUM_OUTPUT="./MANIFESTSUM.sig"

gpg -d "$MANIFESTSUM_OUTPUT" | shasum -c
