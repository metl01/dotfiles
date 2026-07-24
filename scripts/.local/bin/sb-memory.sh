#!/bin/bash
icon=$(printf '\uefc5')
memory=$(free -m | awk '/^Mem:/ {printf "  %.1fG / %.1fG\n", $3/1024, $2/1024}')
echo "$icon $memory"
