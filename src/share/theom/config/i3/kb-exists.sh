#!/bin/bash

USER_KB="$HOME/.config/.theom/keybindings.conf"
DEFAULT_KB="/usr/share/theom/config/.theom/keybindings.conf"

if [[ ! -s "$USER_KB" ]]; then
    echo "User keybindings missing or empty. Copying default keybindings..."
    mkdir -p "$(dirname "$USER_KB")"
    cp "$DEFAULT_KB" "$USER_KB"
    echo "Default keybindings copied to $USER_KB"
else
    echo "User keybindings exist and are non-empty."
fi
