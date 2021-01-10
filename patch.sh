#!/bin/sh -e
#
# SoteriumOS patch script

cd ".." || { echo "!!! Could not cd to ChromiumOS clone"; exit 1; }

find "$PWD/soteriumos/patches" -type f -name "*.patch" | while read -r patch; do
  path="$(dirname "${patch#$PWD/soteriumos/patches/}")";
  [ -d "$PWD/$path" ] || { echo "[!] Subrepository $path not found in tree"; continue; }
  echo "[+] Subrepository $path: applying $(basename "$patch")";
  (
    cd "$PWD/$path";
    git am "$patch";
  )
done;
