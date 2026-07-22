#!/bin/sh
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)
muted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o "yes")
if [ "$muted" = "yes" ]; then
    icon=$(printf '\uf6a9')
    echo "$vol $icon"
else
    icon=$(printf '\uf028')
    echo "$vol $icon "
fi
