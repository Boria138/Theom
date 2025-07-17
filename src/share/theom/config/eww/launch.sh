#!/bin/bash
set -euo pipefail

# waiting for x11
for _ in {1..100}; do
    if xset q &>/dev/null && \
       [[ -n "$DBUS_SESSION_BUS_ADDRESS" ]] && \
       [[ -n "$XDG_RUNTIME_DIR" ]] && \
       [[ -S "$XDG_RUNTIME_DIR/bus" ]]; then
        break
    fi
    sleep 0.05
done

# starting the daemon
if ! pgrep -x eww >/dev/null; then
    eww daemon &
    sleep 0.1
fi

# opening/reloading the bar
if ! eww active-windows | grep -q '^bar: bar$'; then
    # eww open bar will automatically run the daemon if its not running
    # but its slow because it first needs to check, and then wait for the daemon in sync
    # but when we run it seperately, the task is dvidied across 2 ps so its way faster
    eww open bar
    sleep 0.1
fi

eww reload
