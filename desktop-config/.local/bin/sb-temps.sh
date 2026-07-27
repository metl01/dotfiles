#!/bin/sh
icon_cpu=$(printf '\uef2a')
icon_gpu=$(printf '\U000f0379')
out=$(sensors 2>/dev/null)
cpu_temp=$(printf '%s\n' "$out" | grep -E 'Tdie|Tctl|Package id 0' | grep -oP '\+?[0-9]+\.\d+(?=°C)' | tr -d '+' | head -n1)
gpu_temp=$(printf '%s\n' "$out" | grep -A5 'amdgpu' | grep -E 'edge' | grep -oP '\+?[0-9]+\.\d+(?=°C)' | tr -d '+' | head -n1)
echo "$icon_cpu  ${cpu_temp}°C  $icon_gpu  ${gpu_temp}°C"

