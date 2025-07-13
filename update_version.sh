#!/bin/bash

# Check for version argument
if [ -z "$1" ]; then
    echo "Usage: $0 <new_version>"
    exit 1
fi

NEW_VERSION="$1"
NEW_MIGRATE="$2"

# Update pkgver in PKGBUILD
if [ -f "PKGBUILD" ]; then
    sed -i -E "s/^pkgver=.*/pkgver=${NEW_VERSION}/" PKGBUILD
    echo "Updated pkgver in PKGBUILD to $NEW_VERSION"
else
    echo "PKGBUILD not found!"
    exit 1
fi

# Update $VERSION in ./src/bin/theom
THEOM_PATH="./src/bin/theom"
if [ -f "$THEOM_PATH" ]; then
    sed -i -E "s/^(VERSION=\").*(\")/\1${NEW_VERSION}\2/" "$THEOM_PATH"
    echo "Updated VERSION in $THEOM_PATH to $NEW_VERSION"
else
    echo "$THEOM_PATH not found!"
    exit 1
fi

# Update version in ./src/share/theom/version
VERSION_FILE_PATH="./src/share/theom/version"
if [ -f "$VERSION_FILE_PATH" ]; then
    echo "$1" > "$VERSION_FILE_PATH"
    echo "Updated VERSION in $VERSION_FILE_PATH to $NEW_VERSION"
else
    echo "$VERSION_FILE_PATH not found!"
    exit 1
fi

# Update migrate in ./src/share/theom/migrate_config
MIGRATE_FILE_PATH="./src/share/theom/migrate_config"
if [ -f "$MIGRATE_FILE_PATH" ]; then
    echo "$2" > "$MIGRATE_FILE_PATH"
    echo "Updated MIGRATE in $MIGRATE_FILE_PATH to $NEW_MIGRATE"
else
    echo "$MIGRATE_FILE_PATH not found!"
    exit 1
fi

# Function to update .TH line in a man page file
update_man_version() {
    local file="$1"
    if [ ! -f "$file" ]; then
        echo "Warning: $file not found!"
        return
    fi

    local current_version
    current_version=$(grep -m1 '^\.TH[[:space:]]\+theom' "$file" | \
        sed -E 's/^\.TH[[:space:]]+theom[[:space:]]+[0-9]+[[:space:]]+"[^"]+"[[:space:]]+"([^"]+)"[[:space:]]+".*"/\1/')

    if [[ -z "$current_version" ]]; then
        echo "Warning: Could not find version in $file"
        return
    fi

    local version_regex='^[0-9]+(\.[0-9]+)*([-.][a-zA-Z0-9]+)?$'

    if [[ "$current_version" =~ $version_regex ]]; then
        sed -i -E 's/^(\.TH[[:space:]]+theom[[:space:]]+[0-9]+[[:space:]]+")([^"]+)("[[:space:]]+")([^"]+)("[[:space:]]+")([^"]+)(".*)/\1\2\3'"${NEW_VERSION}"'\5\6\7/' "$file"
        echo "Updated VERSION in $file to $NEW_VERSION"
    else
        echo "Skipping $file: VERSION field '$current_version' does not match expected pattern"
    fi
}

# Update man pages
update_man_version "./manual/theom.1"
update_man_version "./manual/theom.5"
