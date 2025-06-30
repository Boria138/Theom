#!/bin/bash

# Exec once
USER_EXEC_ONCE="$HOME/.config/theom-autostarts/exec_once.sh"
DEFAULT_EXEC_ONCE="/usr/share/theom/config/theom-autostarts/exec_once.sh"

# Exec always
USER_EXEC_ALWAYS="$HOME/.config/theom-autostarts/exec_always.sh"
DEFAULT_EXEC_ALWAYS="/usr/share/theom/config/theom-autostarts/exec_always.sh"

# Check exec once
if [[ ! -s "$USER_EXEC_ONCE" ]]; then
    echo "User autostarts (once) missing or empty. Copying default autostarts (once)..."
    mkdir -p "$(dirname "$USER_EXEC_ONCE")"
    cp "$DEFAULT_EXEC_ONCE" "$USER_EXEC_ONCE"
    echo "Default keybindings copied to $USER_EXEC_ONCE"
else
    echo "User autostarts (once) exist and are non-empty."
fi

# Check exec always
if [[ ! -s "$USER_EXEC_ALWAYS" ]]; then
    echo "User autostarts (always) missing or empty. Copying default autostarts (always)..."
    mkdir -p "$(dirname "$USER_EXEC_ALWAYS")"
    cp "$DEFAULT_EXEC_ALWAYS" "$USER_EXEC_ALWAYS"
    echo "Default keybindings copied to $USER_EXEC_ALWAYS"
else
    echo "User autostarts (always) exist and are non-empty."
fi
