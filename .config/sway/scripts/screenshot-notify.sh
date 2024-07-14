#!/bin/sh

set -e

DIR=$HOME/Screenshots

while true; do
    mkdir -p "$DIR" && inotifywait -q -e create "$DIR" --format '%w%f' | xargs notify-send "Screenshot saved"
done
