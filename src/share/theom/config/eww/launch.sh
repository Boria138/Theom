#!/bin/bash

if pgrep -x eww >/dev/null; then
    eww reload
else
    eww daemon &
    sleep 0.5
fi

eww open bar

echo "EWW bar launched."
