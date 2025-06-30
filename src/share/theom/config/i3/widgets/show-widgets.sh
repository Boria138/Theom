#!/bin/bash

# logs
LOGDIR="$HOME/.local/state/theom/logs"
LOGFILE="$LOGDIR/show-widgets.log"
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

log "[START] Starting Conky to load widgets"

# content
enable_widgets=$(theom-config widgets.enable_widgets | tr -d '[:space:]')

if [ "$enable_widgets" = "true" ]; then
    log "[INFO] Widgets are enabled - continuing"

    log "[INFO] Parsing widget paths"
    raw_output=$(theom-config widgets.show)

    if [ -z "$raw_output" ]; then
        log "[ERROR] widgets.show is empty or could not be read"
        exit 0
    fi
    
    cleaned_output=$(echo "$raw_output" | sed -e "s/^\[//" -e "s/\]$//" -e "s/'//g")

    IFS=',' read -r -a widget_array <<< "$cleaned_output"

    for widget in "${widget_array[@]}"; do
        widget="${widget#"${widget%%[![:space:]]*}"}"
        widget="${widget%"${widget##*[![:space:]]}"}"

        widget_path="${widget/#\~/$HOME}"
        
        log "[INFO] Passing cleansed path to conky: $widget_path"
        if [ -f "$widget_path" ]; then
            conky -c "$widget_path" &
        else
            log "[WARN] Widget config not found: $widget_path - skipping"
        fi
    done

    log "[END] Finished without any errors"
fi
