#!/bin/bash
icon=$(printf '\uf4bc')
read -r _ a b c idle _rest < /proc/stat
total1=$((a + b + c + idle))
idle1=$idle
sleep 1
read -r _ d e f idle2 _rest < /proc/stat
total2=$((d + e + f + idle2))
idle2=$idle2
total=$((total2 - total1))
idle=$((idle2 - idle1))
echo "$icon  $(( (total - idle) * 100 / total ))%"
