#!/bin/bash
dir="${1:-.}"
shopt -s nullglob
for f in "$dir"/*.{wav,mp3,flac,ogg,opus}; do
  echo "Now playing: $f"
  paplay "$f"
done
echo "Done."
