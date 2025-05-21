#!/bin/bash
pkill -f theom-notification-history || true
exec theom-notification-history
