#!/bin/sh
icon_cpu=$(printf '\uef2a')

# CPU temp
cpu_temp=""
if [ -f /sys/class/hwmon/hwmon3/temp1_input ]; then
    cpu=$(cat /sys/class/hwmon/hwmon3/temp1_input 2>/dev/null)
    [ -n "$cpu" ] && cpu_temp="$icon_cpu  $((cpu / 1000))°C"
fi

# Output
[ -n "$cpu_temp" ] && printf '%s' "$cpu_temp"
echo
