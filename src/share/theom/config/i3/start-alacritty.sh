#!/bin/bash
theme=$(theom-config appearance.theme | tr -d "[:space:]")
if [ "$theme" = "dark" ]; then
    alacritty --config-file ~/.config/alacritty/dark/alacritty.toml
elif [ "$theme" = "light" ]; then
    alacritty --config-file ~/.config/alacritty/light/alacritty.toml
else
    alacritty
fi