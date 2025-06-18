#!/bin/bash

# First time welcome:
/usr/share/theom/config/i3/other/first-time-welcome.sh &

# Start gfsd
/usr/lib/gvfsd &
/usr/lib/gvfsd-trash &

# Theom greeter
/usr/bin/theom-setup &

# User scripts
## Battery notify
[ ! -s ~/.config/.theom/user_scripts/battery_notify ] && ~/.config/.theom/user_scripts/battery_notify & # Only executed if the script exists and is non-empty