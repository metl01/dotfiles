#!/bin/sh
icon_cpu=$(printf '\uef2a')
icon_gpu=$(printf '\U000f0379')

# CPU temp
cpu_temp=""
if [ -f /sys/class/hwmon/hwmon3/temp1_input ]; then
    cpu=$(cat /sys/class/hwmon/hwmon3/temp1_input 2>/dev/null)
    [ -n "$cpu" ] && cpu_temp="$icon_cpu  $((cpu / 1000))°C"
fi

# GPU temp
gpu_temp=""
gpu_path=$(echo /sys/class/drm/card*/device/hwmon/hwmon*/temp1_input 2>/dev/null)
if [ -f "$gpu_path" ]; then
    gpu=$(cat "$gpu_path" 2>/dev/null)
    [ -n "$gpu" ] && gpu_temp="$icon_gpu  $((gpu / 1000))°C"
fi

# Output
[ -n "$cpu_temp" ] && printf '%s' "$cpu_temp"
[ -n "$cpu_temp" ] && [ -n "$gpu_temp" ] && printf '  '
[ -n "$gpu_temp" ] && printf '%s' "$gpu_temp"
echo
