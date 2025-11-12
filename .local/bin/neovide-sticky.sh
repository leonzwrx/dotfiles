#!/bin/bash

NOTE_FILE="$HOME/Documents/neovide-sticky.md"
APP_ID="neovidesticky"
NEOVIDE_PATH="$HOME/Applications/neovide.appimage"

# Create the file if it doesn't exist
touch "$NOTE_FILE"

"$NEOVIDE_PATH" "$NOTE_FILE" \
    --wayland_app_id "$APP_ID" \
    --size=600x400 & \
