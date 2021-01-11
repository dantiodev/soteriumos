#!/bin/sh -e
#
# SoteriumOS patch script

srcroot="$(dirname "$(dirname "$0")")";
find "$(dirname "$0")/patches" -type f -name "*.patch" | while read -r patch; do
  path="$(dirname "${patch#$(dirname "$0")/patches/}")";
  [ -d "$srcroot/$path" ] || { echo "[!] Subrepository $path not found in tree"; continue; }
  echo "[+] Subrepository $path: applying $(basename "$patch")";
  (
    cd "$srcroot/$path";
    git am "$patch";
  )
done;
