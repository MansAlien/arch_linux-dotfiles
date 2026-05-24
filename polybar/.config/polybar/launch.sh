#!/bin/bash
# Kill existing instances
pkill polybar
pkill nm-applet
pkill blueman-applet

# Wait for polybar to fully start and grab the tray
polybar main &
sleep 1

# Now start tray apps
nm-applet &
blueman-applet &
