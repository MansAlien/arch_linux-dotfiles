#!/bin/bash
THRESHOLD=20
NOTIFIED=false

while true; do
    LEVEL=$(cat /sys/class/power_supply/BAT1/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT1/status)

    if [ "$LEVEL" -le "$THRESHOLD" ] && [ "$STATUS" = "Discharging" ]; then
        if [ "$NOTIFIED" = false ]; then
            notify-send -u critical "Battery Low" "${LEVEL}% remaining — plug in your charger" -i battery-low
            paplay --volume=130000 /usr/share/sounds/freedesktop/stereo/dialog-warning.oga &
            NOTIFIED=true
        fi
    else
        NOTIFIED=false
    fi

    sleep 60
done
