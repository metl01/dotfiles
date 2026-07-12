#!/bin/sh
weatherfile="$HOME/.cache/weather.txt"

update_weather() {
    while true; do
        condition=$(curl -s "wttr.in/?format=%C" 2>/dev/null)
        temp=$(curl -s "wttr.in/?format=%t" 2>/dev/null)
        case "$condition" in
            *Sunny*|*Clear*) icon=$(printf '\ue30d') ;;
            *Partly*cloudy*) icon=$(printf '\ue302') ;;
            *Cloudy*|*Overcast*) icon=$(printf '\ue312') ;;
            *Rain*|*Drizzle*) icon=$(printf '\ue318') ;;
            *Thunder*) icon=$(printf '\ue31d') ;;
            *Snow*) icon=$(printf '\ue31a') ;;
            *Fog*|*Mist*) icon=$(printf '\ue313') ;;
            *Sleet*|*Ice*|*Freezing*rain*|*Blizzard*) icon=$(printf '\ue316') ;;
            *) icon="" ;;
        esac
        echo "$icon $temp" > "$weatherfile"
        sleep 1800
    done
}
update_weather &

while true; do
    weather=$(cat "$weatherfile" 2>/dev/null)
    xsetroot -name "$(date '+%a %b %d  %I:%M %p') | $weather"
    sleep $((60 - $(date +%S)))
done
