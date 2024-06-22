#!/bin/sh
pactl subscribe | while read -r line; do
  if [[ $line == *"hdmi connected"* ]]; then
    pactl set-default-sink "alsa_output.usb-C-Media_INC._USB_Sound_Device-00.analog-stereo"
  elif [[ $line == *"hdmi disconnected"* ]]; then
    pactl set-default-sink "alsa_output.pci-0000_00_1f.3.analog-stereo"
  fi
done
