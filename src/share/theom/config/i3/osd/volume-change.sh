#!/bin/bash

enable_osd=$(theom-config features.osd | tr -d "[:space:]")

if [[ "$enable_osd" == "true" ]]; then
    ~/.config/theom/.osd-snippets/volume.sh
fi
