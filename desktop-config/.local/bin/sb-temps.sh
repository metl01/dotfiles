#!/bin/sh
icon_cpu=$(printf '\uef2a')
icon_gpu=$(printf '\U000f0379')

#!/usr/bin/env bash
# CPU temp
cpu_temp=$(sensors 2>/dev/null | grep -E 'Tdie|Tctl|Package id 0' | grep -oP '\+?[0-9]+\.\d+(?=°C)' | tr -d '+' | head -n1)

# GPU temp (amdgpu) - use 'edge' for the general die temp, or 'junction' for hotspot
gpu_temp=$(sensors 2>/dev/null | grep -A5 'amdgpu' | grep -E 'edge' | grep -oP '\+?[0-9]+\.\d+(?=°C)' | tr -d '+' | head -n1)

echo "$icon_cpu  ${cpu_temp}°C  $icon_gpu  ${gpu_temp}°C"

