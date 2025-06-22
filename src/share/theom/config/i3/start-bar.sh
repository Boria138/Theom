#!/bin/bash
use_eww=$(theom-config bar.use_eww | tr -d '[:space:]')

if [ "$use_eww" = "true" ]; then
    ~/.config/eww/launch.sh
elif [ "$use_eww" = "false" ]; then
    ~/.config/polybar/launch.sh
fi
