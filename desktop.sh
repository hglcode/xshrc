#!/bin/sh
[ "$(tty)" = "/dev/tty1" ] && [ -z "$DISPLAY" ] && [ "$(id -u -n)" = "l" ] && exec dbus-run-session start-hyprland && exit 0 || echo 'Failed to start hyprland desktop environment!'
