#!/bin/bash
theme=$(theom-config appearance.theme | tr -d '[:space:]')

if [ "$theme" = "dark" ]; then
    dunst -config ~/.config/dunst/dark/dunstrc & 
elif [ "$theme" = "light" ]; then
    dunst -config ~/.config/dunst/light/dunstrc & 
else
    dunst
fi
