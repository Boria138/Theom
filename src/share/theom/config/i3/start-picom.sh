#!/bin/bash

# logs
LOGDIR="$HOME/.local/state/theom/logs"
LOGFILE="$LOGDIR/compositor.log"
MAXSIZE=51200  # 50 KB

mkdir -p "$LOGDIR"

# Emptying if too large
if [ -f "$LOGFILE" ] && [ "$(stat -c%s "$LOGFILE")" -gt "$MAXSIZE" ]; then
    : > "$LOGFILE"
fi

log() {
    echo "[$(date '+%F %T')] $*" >> "$LOGFILE"
}

trap 'log "[ERROR] Command failed at line $LINENO: $BASH_COMMAND (exit $?)"' ERR
set -o errtrace

log "[START] Starting Compositor (Picom)"

# actual stuff
enable_compositing=$(theom-config compositor.compositing | tr -d "[:space:]")
compositing_mode=$(theom-config compositor.compositing_mode | tr -d "[:space:]")
theom_theme=$(theom-config appearance.theme | tr -d '[:space:]')

if xprop -root _NET_WM_CM_S0 >/dev/null 2>&1; then
    log "[WARN] Another compositor is already running"
    log "[END] Aborting compositor launch"
    exit 0
fi

if [ "$enable_compositing" = "true" ]; then
    log "[INFO] Compositor is enabled - continuing"
    if [ "$compositing_mode" = "compatibility" ]; then
        if [ "$theom_theme" = "light" ]; then
            log "[INFO] Running compositor - Light theme | Compatibility Mode"
            picom --config /usr/share/theom/config/picom/compatibility/picom-light.conf &
            picom_pid=$!
        else
        log "[INFO] Running compositor - Dark theme | Compatibility Mode"
            picom --config /usr/share/theom/config/picom/compatibility/picom-dark.conf &
            picom_pid=$!
        fi
    elif [ "$compositing_mode" = "performance" ]; then
        if [ "$theom_theme" = "light" ]; then
            log "[INFO] Running compositor - Light theme | Performance Mode"
            picom --config /usr/share/theom/config/picom/performance/picom-light.conf &
            picom_pid=$!
        else
            log "[INFO] Running compositor - Dark theme | Performance Mode"
            picom --config /usr/share/theom/config/picom/performance/picom-dark.conf &
            picom_pid=$!
        fi
    fi

    for _ in {1..50}; do
        if xprop -root _NET_WM_CM_S0 >/dev/null 2>&1; then
            echo "Compositor ready"
            log "[END] Compositor is up and running"
            break
        fi

        if ! kill -0 "$picom_pid" 2>/dev/null; then
            log "[ERROR] picom crashed or exited prematurely"
            break
        fi

        sleep 0.1
    done
fi
