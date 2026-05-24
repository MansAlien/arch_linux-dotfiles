#!/bin/bash

chosen=$(echo -e "⏻ Shutdown\n Restart\n Suspend\n Lock\n Logout" | rofi -dmenu \
    -theme ~/.config/rofi/catppuccin.rasi \
    -p "Power" \
    -i)

case "$chosen" in
    "⏻ Shutdown") systemctl poweroff ;;
    " Restart")   systemctl reboot ;;
    " Suspend")   systemctl suspend ;;
    " Lock")      i3lock -c 000000 ;;
    " Logout")    i3-msg exit ;;
esac
