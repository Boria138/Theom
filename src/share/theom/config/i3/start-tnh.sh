#!/bin/bash
if systemctl --user is-active --quiet theom-notification-history.service; then
    systemctl --user restart theom-notification-history.service
else
    systemctl --user start theom-notification-history.service
fi
