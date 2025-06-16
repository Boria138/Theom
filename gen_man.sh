#!/bin/bash

set -e

MANDIR="./manual"
OUTROOT="./src/share/man"

echo "==== Compressing the manuals ===="

for file in "$MANDIR"/*; do
    [ -f "$file" ] || continue

    echo "Compressing: $file"
    gzip -kf "$file"
done

echo
echo "==== Moving compressed files to appropriate man section directories ===="

for gzfile in "$MANDIR"/*.gz; do
    [ -f "$gzfile" ] || continue

    filename=$(basename "$gzfile")

    section=$(echo "$filename" | sed -E 's/.*\.([0-9]+)\.gz/\1/')

    if [[ "$section" =~ ^[0-9]+$ ]]; then
        outdir="$OUTROOT/man$section/"
        mkdir -p "$outdir"
        echo "Moving $filename → $outdir"
        mv -v "$gzfile" "$outdir"
    else
        echo "Skipping $filename (unrecognized man section)"
    fi
done

echo
echo "==== Finished ===="
