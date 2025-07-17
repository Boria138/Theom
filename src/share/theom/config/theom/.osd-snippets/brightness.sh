#!/bin/bash


brightness_percent=""

# Trying sysfs backlight
for device in /sys/class/backlight/*; do
  if [[ -f "$device/brightness" && -f "$device/max_brightness" ]]; then
    current=$(cat "$device/brightness")
    max=$(cat "$device/max_brightness")
    if [[ $max -gt 0 ]]; then
      brightness_percent=$(( 100 * current / max ))
      break
    fi
  fi
done

# Trying xbacklight
if [[ -z "$brightness_percent" && $(command -v xbacklight) ]]; then
  val=$(xbacklight -get 2>/dev/null)
  if [[ $? -eq 0 && "$val" != "" ]]; then
    brightness_percent=$(printf "%.0f" "$val")
  fi
fi

if [[ -z "$brightness_percent" ]]; then
  echo "Error: Could not determine brightness level." >&2
  exit 1
fi

# osd
theme=$(theom-config appearance.theme | tr -d "[:space:]")

if [ "$theme" = "light" ]; then
  tosd-client "//brightness-high-symbolic//" \
      slider "$brightness_percent" \
      -d 2 \
      -s 0.5 \
      -p T \
      --margin-x 0 \
      --margin-y 65 \
      --background-color "#efe1ca" \
      --slider-fill-color "#beb2a0" \
      --slider-knob-color "#b4a494"
else
  tosd-client "//brightness-high-symbolic//" \
      slider "$brightness_percent" \
      -d 2 \
      -s 0.5 \
      -p T \
      --margin-x 0 \
      --margin-y 65 \
      --background-color "#222221" \
      --slider-fill-color "#b0b4bc" \
      --slider-knob-color "#c9c9cb"
fi