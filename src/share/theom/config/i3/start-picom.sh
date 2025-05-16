if [ "$(theom-config compositor | tr -d "[:space:]")" = "True" ]; then
    if [ "$(theom-config theme | tr -d '[:space:]')" = "light" ]; then
        picom --config /usr/share/theom/config/picom/picom-light.conf &
    else
        picom --config /usr/share/theom/config/picom/picom-dark.conf &
    fi
fi