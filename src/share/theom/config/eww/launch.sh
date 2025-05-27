#!/bin/bash

if ! pgrep -x eww >/dev/null; then
    eww daemon &
    while ! eww ping &>/dev/null; do
        sleep 0.1
    done
else
    eww reload
fi

if ! eww active-windows | grep -q '^bar: bar$'; then
    eww open bar
    echo "EWW bar launched."
else
    echo "EWW bar already open."
fi
