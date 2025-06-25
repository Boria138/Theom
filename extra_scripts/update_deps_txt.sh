#!/bin/bash

PKGBUILD="./PKGBUILD"
OUTFILE="./deps.txt"

echo "Extracting dependencies from $PKGBUILD..."

deps=$(awk '
    BEGIN { in_dep = 0 }
    /^depends=\(/ { in_dep = 1; next }
    /^\)/ { in_dep = 0 }
    in_dep {
        # Skip line if the first non-space character is #
        line = $0
        sub(/^[ \t\r\n]+/, "", line)
        if (line ~ /^#/) next

        # Remove inline comments
        sub(/[[:space:]]+#.*/, "", line)

        # Remove surrounding quotes
        gsub(/^["'\''"]+|["'\''"]+$/, "", line)

        # Remove version constraints
        gsub(/[<>=].*$/, "", line)

        # Remove all internal spaces
        gsub(/[[:space:]]+/, "", line)

        if (length(line) > 0) print line
    }
' "$PKGBUILD" | sort -u)

if [[ -z "$deps" ]]; then
    echo "No dependencies found."
    exit 1
fi

echo "$deps" > "$OUTFILE"
echo "Updated dependencies written to $OUTFILE"
