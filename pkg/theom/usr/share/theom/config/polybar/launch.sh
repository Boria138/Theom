#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

# Wait for PipeWire to be fully ready
for _ in {1..10}; do
    if pgrep -x pipewire > /dev/null; then
        break
    fi
    sleep 0.5
done

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q main -c "$DIR"/config.ini &
