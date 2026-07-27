#!/bin/bash
icon=$(printf '\uf4bc')
cache="${XDG_CACHE_HOME:-$HOME/.cache}/cpu_usage_prev"

read -r _ user nice system idle iowait irq softirq steal _ < /proc/stat
idle_all=$((idle + iowait))
total=$((user + nice + system + idle_all + irq + softirq + steal))

if [ -f "$cache" ]; then
    read -r prev_total prev_idle < "$cache"
    diff_total=$((total - prev_total))
    diff_idle=$((idle_all - prev_idle))
    if [ "$diff_total" -gt 0 ]; then
        pct=$(( (diff_total - diff_idle) * 100 / diff_total ))
    else
        pct=0
    fi
else
    pct=0
fi

printf '%s\n' "$total $idle_all" > "$cache"
echo "$icon  ${pct}%"
