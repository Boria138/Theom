#!/bin/bash

enable_compositing=$(theom-config compositor.compositing | tr -d "[:space:]")
compositing_mode=$(theom-config compositor.compositing_mode | tr -d "[:space:]")
theom_theme=$(theom-config appearance.theme | tr -d '[:space:]')

if [ "$enable_compositing" = "true" ]; then
    if [ "$compositing_mode" = "compatibility" ]; then
        if [ "$theom_theme" = "light" ]; then
            picom --config /usr/share/theom/config/picom/compatibility/picom-light.conf &
        else
            picom --config /usr/share/theom/config/picom/compatibility/picom-dark.conf &
        fi
    elif [ "$compositing_mode" = "performance" ]; then
        if [ "$theom_theme" = "light" ]; then
            picom --config /usr/share/theom/config/picom/performance/picom-light.conf &
        else
            picom --config /usr/share/theom/config/picom/performance/picom-dark.conf &
        fi
    fi

    for _ in {1..50}; do
        if xprop -root _NET_WM_CM_S0 >/dev/null 2>&1; then
            echo "Compositor ready"
            break
        fi
        sleep 0.1
    done
fi
