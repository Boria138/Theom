#!/bin/bash

enable_osd=$(theom-config osd | tr -d "[:space:]")

if [[ "$enable_osd" == "True" ]]; then
    ~/.config/.theom/osd-snippets/brightness.sh
fi
