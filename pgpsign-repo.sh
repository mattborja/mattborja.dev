#!/bin/sh
# pgpsign-repo.sh
# Builds signed list (recursive) of SHA2 checksums in $TARGET_PATH using $PGP_KEY
#
# Example usage (current directory): pgpsign-repo.sh . 33688C2EDC08CD38 > MANIFESTSUM.asc
# 
# Copyright (c) 2022 Matt Borja
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

TARGET_PATH="$1"
PGP_KEY="$2"

if [ -z "$TARGET_PATH" ] || [ -z "$PGP_KEY" ]; then
  echo "Usage: $0 <TARGET_PATH> <PGP_SIGNING_KEYID>"
  exit 1
fi

find "$TARGET_PATH" -type f -not -path "*/.*" -not -name "MANIFESTSUM.asc" \
 | sort \
 | xargs shasum -a 256 \
 | gpg --clearsign --armor --local-user "$PGP_KEY" --comment "To verify this file, run: gpg -d MANIFESTSUM.asc | shasum -c"

if [ "$?" -eq 0 ]; then
       >&2 echo "To verify (via decrypt) and verify checksums: gpg -d <FILE> | shasum -c"
else
       >&2 echo "Signing failed."
fi
