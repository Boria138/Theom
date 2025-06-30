#!/bin/bash
TSCL_PATH="$HOME/.local/state/theom/meta.tscd"
TSC="/usr/share/theom/scripts/tscdctl"
TSCD_value=$($TSC --get current_run --out "$TSCL_PATH")

if [ "$TSCD_value" = "True" ]; then
    notify-send "Welcome to theom!"
fi