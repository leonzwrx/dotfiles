#!/usr/bin/env sh
set -x

# Only try if a backlight device exists
BACKLIGHT_DEVICE=$(brightnessctl --list | grep -E 'kbd_backlight|intel_backlight' | awk -F"'" '{print $2}')

if [ -n "$BACKLIGHT_DEVICE" ]; then
    case "$1" in
        on)
            brightnessctl -r -d "$BACKLIGHT_DEVICE"
            ;;
        off)
            brightnessctl -s -d "$BACKLIGHT_DEVICE" && brightnessctl -d "$BACKLIGHT_DEVICE" set 0
            ;;
        *)
            echo "Usage: $0 [on|off]"
            ;;
    esac
else
    echo "No backlight device found, skipping."
fi

