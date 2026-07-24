#!/bin/sh
icon=$(printf '\U000f02ca')
df -h / | awk -v icon="$icon" 'NR==2{printf "%s %s/%s", icon, $3, $2}'
