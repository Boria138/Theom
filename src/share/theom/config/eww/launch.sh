#!/bin/bash

if ! pgrep -x eww >/dev/null; then
    eww daemon &
    while ! eww ping &>/dev/null; do
        sleep 0.1
    done
fi

if ! eww active-windows | grep -q '^bar: bar$'; then
    eww open bar
    echo "EWW bar launched."
    sleep 0.1
else
    eww reload
    echo "Existing bar found and it has been reloaded."
fi
