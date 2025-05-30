#!/usr/bin/env bash

DIR="$HOME/.config/polybar"

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get theme
theme=$(theom-config appearance.theme | tr -d "[:space:]")

# Get layout (float or stuck)
layout=$(theom-config bar.polybar-layout | tr -d "[:space:]")

LAYOUT_DIR="$DIR/modules"
LAYOUT_TARGET="$LAYOUT_DIR/layout.conf"
LAYOUT_FLOAT="$LAYOUT_DIR/layout.float.conf"
LAYOUT_STUCK="$LAYOUT_DIR/layout.stuck.conf"

if [ "$layout" = "float" ]; then
    cp "$LAYOUT_FLOAT" "$LAYOUT_TARGET"
elif [ "$layout" = "stuck" ]; then
    cp "$LAYOUT_STUCK" "$LAYOUT_TARGET"
else
    cp "$LAYOUT_FLOAT" "$LAYOUT_TARGET"
fi

# Launch Polybar with correct theme config
if [ "$theme" = "dark" ]; then
    polybar -q main -c "$DIR/dark/config.ini" &
elif [ "$theme" = "light" ]; then
    polybar -q main -c "$DIR/light/config.ini" &
else
    polybar -q main -c "$DIR/dark/config.ini" &
fi
