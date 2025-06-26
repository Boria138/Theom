#!/bin/bash

enable_widgets=$(theom-config widgets.enable_widgets | tr -d '[:space:]')

if [ "$enable_widgets" = "true" ]; then
    raw_output=$(theom-config widgets.show)
    
    cleaned_output=$(echo "$raw_output" | sed -e "s/^\[//" -e "s/\]$//" -e "s/'//g")

    IFS=',' read -r -a widget_array <<< "$cleaned_output"

    for widget in "${widget_array[@]}"; do
        widget="${widget#"${widget%%[![:space:]]*}"}"
        widget="${widget%"${widget##*[![:space:]]}"}"
        
        widget_path="${widget/#\~/$HOME}"
        conky -c "$widget_path" &
    done
fi
