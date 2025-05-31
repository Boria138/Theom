#!/bin/bash
use_eww=$(theom-config bar.use_eww | tr -d '[:space:]')

if [ "$use_eww" != "false" ]; then
    ~/.config/eww/launch.sh
else
    ~/.config/polybar/launch.sh
fi
