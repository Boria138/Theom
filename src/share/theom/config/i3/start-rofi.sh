#!/bin/bash
theme=$(theom-config appearance.theme | tr -d "[:space:]")
if [ "$theme" = "dark" ]; then
    rofi -no-config -no-lazy-grab -show drun -modi drun -theme ~/.config/rofi/dark/config.rasi
elif [ "$theme" = "light" ]; then
    rofi -no-config -no-lazy-grab -show drun -modi drun -theme ~/.config/rofi/light/config.rasi
else
    rofi -no-config -no-lazy-grab -show drun -modi drun -theme ~/.config/rofi/config.rasi
fi