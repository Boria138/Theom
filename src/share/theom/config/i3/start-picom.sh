#!/bin/bash

# logs
LOGDIR="$HOME/.local/state/theom/logs"
LOGFILE="$LOGDIR/compositor.log"
MAXSIZE=51200 # 50 KB

mkdir -p "$LOGDIR"

# Emptying if too large
if [ -f "$LOGFILE" ] && [ "$(stat -c%s "$LOGFILE")" -gt "$MAXSIZE" ]; then
  : >"$LOGFILE"
fi

log() {
  echo "[$(date '+%F %T')] $*" >>"$LOGFILE"
}

trap 'log "[ERROR] Command failed at line $LINENO: $BASH_COMMAND (exit $?)"' ERR
set -o errtrace

log "[START] Starting Compositor (Picom)"

enable_compositing=$(theom-config compositor.compositing | tr -d "[:space:]")
if [ "$enable_compositing" != "true" ]; then
  log "[INFO] Compositor is disabled in config"
  exit 0
fi

if xprop -root | grep -q _NET_WM_CM_S0; then
  log "[WARN] Another compositor is already running"
  exit 1
fi

# Prepare paths and generate config
GEN_OUT=~/.local/state/theom/generated/picom
mkdir -p "$GEN_OUT"

theme=$(theom-config appearance.theme | tr -d '[:space:]')
mode=$(theom-config compositor.compositing_mode | tr -d '[:space:]')

tcomp-gen -g \
  /usr/share/theom/config/picom/base.json \
  "/usr/share/theom/config/picom/themes/${theme}.json" \
  "/usr/share/theom/config/picom/modes/${mode}.json" \
  "$GEN_OUT"

log "[INFO] Running compositor - Theme: $theme | Mode: $mode"
picom --config "$GEN_OUT/picom.conf" &
picom_pid=$!

# Startup wait loop
for _ in {1..50}; do
  if xprop -root | grep -q _NET_WM_CM_S0; then
    log "[END] Compositor is up and running"
    break
  fi
  if ! kill -0 "$picom_pid" 2>/dev/null; then
    log "[ERROR] picom crashed or exited prematurely"
    break
  fi
  sleep 0.1
done
