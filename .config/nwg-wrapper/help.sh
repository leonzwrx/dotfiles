#!/bin/sh
$HOME/.config/sway/scripts/sbdp.py $HOME/.config/sway/config | jq --raw-output 'sort_by(.category) | .[] | .action + ": <b>" + .keybinding + "</b>"'
