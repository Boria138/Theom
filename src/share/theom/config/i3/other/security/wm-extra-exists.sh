#!/bin/bash

USER_EXTRAS="$HOME/.config/theom/.win/extra_config.conf"
DEFAULT_EXTRAS="/usr/share/theom/config/theom/.win/extra_config.conf"

if [[ ! -s "$USER_EXTRAS" ]]; then
    echo "Extra WM configs missing or empty. Copying default Extra WM configs..."
    mkdir -p "$(dirname "$USER_EXTRAS")"
    cp "$DEFAULT_EXTRAS" "$USER_EXTRAS"
    echo "Default extra wm configs copied to $USER_EXTRAS"
else
    echo "Extra WM configs exist and are non-empty."
fi
