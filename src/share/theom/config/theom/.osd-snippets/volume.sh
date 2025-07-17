#!/bin/bash

volume_percent=""

# trying pulse audio
if command -v pactl >/dev/null 2>&1; then
  default_sink=$(pactl info | grep 'Default Sink' | awk '{print $3}')
  
  vol_info=$(pactl get-sink-volume "$default_sink" 2>/dev/null | head -n1)
  
  if [[ $vol_info =~ ([0-9]+)% ]]; then
    volume_percent="${BASH_REMATCH[1]}"
  fi
fi

# trying ALSA amixer
if [[ -z "$volume_percent" ]] && command -v amixer >/dev/null 2>&1; then
  vol_info=$(amixer get Master | grep -o -m 1 '[0-9]\+%')
  if [[ $vol_info =~ ([0-9]+)% ]]; then
    volume_percent="${BASH_REMATCH[1]}"
  fi
fi

if [[ -z "$volume_percent" ]]; then
  echo "Error: Could not determine volume level." >&2
  exit 1
fi

# osd
theme=$(theom-config appearance.theme | tr -d "[:space:]")

if [ "$theme" = "light" ]; then
  tosd-client "//audio-volume-high-symbolic//" \
      slider "$volume_percent" \
      -d 2 \
      -s 0.5 \
      -p T \
      --margin-x 0 \
      --margin-y 65 \
      --background-color "#efe1ca" \
      --slider-fill-color "#beb2a0" \
      --slider-knob-color "#b4a494"
else
  tosd-client "//audio-volume-high-symbolic//" \
      slider "$volume_percent" \
      -d 2 \
      -s 0.5 \
      -p T \
      --margin-x 0 \
      --margin-y 65 \
      --background-color "#222221" \
      --slider-fill-color "#b0b4bc" \
      --slider-knob-color "#c9c9cb"
fi