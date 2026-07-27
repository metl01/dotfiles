#!/bin/sh
icon_cpu=$(printf '\uef2a')
out=$(sensors 2>/dev/null)
cpu_temp=$(printf '%s\n' "$out" | grep -E 'CPU' | grep -oP '\+?[0-9]+\.\d+(?=°C)' | tr -d '+' | head -n1)
echo "$icon_cpu  ${cpu_temp}°C"
