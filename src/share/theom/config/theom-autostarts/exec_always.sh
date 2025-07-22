#!/bin/bash

# ScreenShot
flameshot &

# Systray applets
parcellite &
nm-applet &

# Wallpaper
if wp=$(theom-config appearance.wallpaper 2>/dev/null); then
  feh --bg-scale "$wp" &
fi

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

# Theom Functions
## App configs
if [ "$(theom-config functions.autoset_appconfs)" = "true" ]; then
  update-theom-appconfs 2>/dev/null &
fi

## Gammastep nightlight filter wrapper
if [ "$(theom-config functions.enable_nightlight)" = "true" ]; then
  # Note: gammastep-tapplet launches gammastep automatically
  gammastep-tapplet 2>/dev/null &
fi