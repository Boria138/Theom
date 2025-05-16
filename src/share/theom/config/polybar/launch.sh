#!/usr/bin/env bash

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
theme=$(theom-config theme | tr -d "[:space:]")
if [ "$theme" = "dark" ]; then
    polybar -q main -c "$DIR"/dark/config.ini &
elif [ "$theme" = "light" ]; then
    polybar -q main -c "$DIR"/light/config.ini &
else
    polybar -q main -c "$DIR"/dark/config.ini &
fi