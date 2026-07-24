#!/bin/sh
vol_info=""
attempts=0
while [ -z "$vol_info" ] && [ "$attempts" -lt 10 ]; do
    vol_info=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null)
    attempts=$((attempts + 1))
    [ -z "$vol_info" ] && sleep 1
done
vol_pct=$(echo "$vol_info" | awk '{printf "%d", $2 * 100}')
if echo "$vol_info" | grep -qi 'MUTED'; then
    icon=$(printf '\uf6a9')
    echo "$icon  ${vol_pct}%"
else
    icon=$(printf '\uf028')
    echo "$icon   ${vol_pct}%"
fi
