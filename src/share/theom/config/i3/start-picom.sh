#!/bin/bash

enable_compositing=$(theom-config compositor.compositing | tr -d "[:space:]")
compositing_mode=$(theom-config compositor.compositing_mode | tr -d "[:space:]")
theom_theme=$(theom-config appearance.theme | tr -d '[:space:]')

if [ "$enable_compositing" = "True" ]; then
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
    #else
    #    if [ "$theom_theme" = "light" ]; then
    #        picom --config /usr/share/theom/config/picom/performance/picom-light.conf &
    #    else
    #        picom --config /usr/share/theom/config/picom/performance/picom-dark.conf &
    #    fi # Well, no safety net if you did a typo ;)
    fi
fi