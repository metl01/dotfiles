#!/bin/sh
batpath="/sys/class/power_supply/BAT0"
[ -d "$batpath" ] || exit 0
cap=$(cat "$batpath/capacity" 2>/dev/null)
status=$(cat "$batpath/status" 2>/dev/null)
case "$status" in
    Charging) icon=$(printf '\U000f0084') ;;
    Discharging)
        if [ "$cap" -le 15 ]; then icon=$(printf '\U000f0083')
        elif [ "$cap" -le 50 ]; then icon=$(printf '\U000f007c')
        else icon=$(printf '\U000f0080')
        fi
        ;;
    Full) icon=$(printf '\U000f0079') ;;
    *) icon="" ;;
esac
echo "$icon $cap%"
