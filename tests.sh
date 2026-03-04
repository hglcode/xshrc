#!/bin/sh

set -e
self=$(readlink -f "$0")
here=$(dirname "$self")

# shellcheck disable=SC1091
. "$here/shrc.sh"

#if [ "$(tty)" = "/dev/tty1" ] && [ -z "$DISPLAY" ] && [ "$(id -u -n)" = "l" ]; then
#
#    # 默认启动命令
#    local DEFAULT="dbus-run-session start-hyprland"
#    local TIMEOUT=1
#    local TEMPFILE=$(mktemp)
#    timeout "$TIMEOUT" fzf --prompt="Select Desktop: " --height=~30% --reverse <<< $(echo -e "Hyprland\nPlasma (wayland)\nPlasma (X11)\nShell") 2>/dev/null > "$TEMPFILE"
#    local choice=$(cat "$TEMPFILE")
#    /bin/rm -rf "$TEMPFILE"
#    [ $? -eq 124 ] && exec $DEFAULT && exit 0
#    case "$choice" in
#        "Hyprland") exec dbus-run-session start-hyprland ;;
#        "Plasma (wayland)") exec startplasma-wayland ;;
#        "Plasma (X11)") exec startplasma-x11 ;;
#        "Shell") ;;
#        *) exec $DEFAULT ;;
#    esac
#fi
