#!/bin/sh
weatherfile="$HOME/.cache/weather.txt"

update_weather() {
    while true; do
        icon=$(curl -s "wttr.in/?format=%c" 2>/dev/null)
        temp=$(curl -s "wttr.in/?format=%t" 2>/dev/null)
        echo "$icon$temp" > "$weatherfile"
        sleep 1800
    done
}
update_weather &

while true; do
    weather=$(cat "$weatherfile" 2>/dev/null)
    xsetroot -name "$(date '+%a %b %d  %I:%M %p') | $weather"
    sleep $((60 - $(date +%S)))
done
