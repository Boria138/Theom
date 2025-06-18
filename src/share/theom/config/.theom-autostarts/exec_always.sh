#!/bin/bash

# ScreenShot 
flameshot &

# Systray applets
parcellite &
nm-applet &

# Wallpaper
if [ "$(theom-config appearance.wallpaper | tr -d "[:space:]")" != "false" ]; then feh --bg-scale $(theom-config appearance.wallpaper); fi

# Start bar (polybar/eww)
/usr/share/theom/config/i3/start-bar.sh &

# Widgets (conky)
/usr/share/theom/config/i3/widgets/show-widgets.sh &

# Notification daemon (dunst)
/usr/share/theom/config/i3/start-dunst.sh &

# Notification history saver
/usr/share/theom/config/i3/start-tnh.sh &

# MPD music daemon
mpd &

# Theom on screen display server (depricated)
/usr/share/theom/config/i3/osd/start-tosds.sh &