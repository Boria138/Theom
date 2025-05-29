#!/bin/bash

enable_osd=$(theom-config osd | tr -d "[:space:]")

if [[ "$enable_osd" == "True" ]]; then
    if systemctl --user is-active --quiet tosd.service; then
        echo "tosd.service is running, restarting..."
        systemctl --user restart tosd.service
    else
        echo "tosd.service is not running, starting..."
        systemctl --user start tosd.service
    fi
fi
