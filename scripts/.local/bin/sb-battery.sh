#!/bin/sh
batpath="/sys/class/power_supply/BAT0"
[ -d "$batpath" ] || exit 0
cap=$(cat "$batpath/capacity" 2>/dev/null)
status=$(cat "$batpath/status" 2>/dev/null)
case "$status" in
    Charging)
        if   [ "$cap" -le 10 ]; then icon=$(printf '\U000f089c')
        elif [ "$cap" -le 20 ]; then icon=$(printf '\U000f0086')
        elif [ "$cap" -le 30 ]; then icon=$(printf '\U000f0087')
        elif [ "$cap" -le 40 ]; then icon=$(printf '\U000f0088')
        elif [ "$cap" -le 50 ]; then icon=$(printf '\U000f089d')
        elif [ "$cap" -le 60 ]; then icon=$(printf '\U000f0089')
        elif [ "$cap" -le 70 ]; then icon=$(printf '\U000f089e')
        elif [ "$cap" -le 80 ]; then icon=$(printf '\U000f008a')
        elif [ "$cap" -le 90 ]; then icon=$(printf '\U000f008b')
        elif [ "$cap" -le 100 ]; then icon=$(printf '\U000f0085')
        fi
        ;;
    Discharging)
        if   [ "$cap" -le 10 ]; then icon=$(printf '\U000f007a')
        elif [ "$cap" -le 20 ]; then icon=$(printf '\U000f007b')
        elif [ "$cap" -le 30 ]; then icon=$(printf '\U000f007c')
        elif [ "$cap" -le 40 ]; then icon=$(printf '\U000f007d')
        elif [ "$cap" -le 50 ]; then icon=$(printf '\U000f007e')
        elif [ "$cap" -le 60 ]; then icon=$(printf '\U000f007f')
        elif [ "$cap" -le 70 ]; then icon=$(printf '\U000f0080')
        elif [ "$cap" -le 80 ]; then icon=$(printf '\U000f0081')
        elif [ "$cap" -le 90 ]; then icon=$(printf '\U000f0082')
        elif [ "$cap" -le 100 ]; then icon=$(printf '\U000f0079')
        fi
        ;;

    'Not charging') icon=$(printf '\U000f0085') ;;
    *) icon="" ;;
esac
echo "$icon $cap%"
