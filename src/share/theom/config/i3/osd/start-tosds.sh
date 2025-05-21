#!/bin/bash

enable_osd=$(theom-config osd | tr -d "[:space:]")

if [[ "$enable_osd" == "True" ]]; then
    pkill -f tosd_server.py || true

    exec tosd-server
fi
