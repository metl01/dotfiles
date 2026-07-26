#!/bin/sh
icon=$(printf '\U000f1393')
usage=$(cat /sys/class/drm/card1/device/gpu_busy_percent 2>/dev/null) || exit 0
echo "$icon $usage%"
