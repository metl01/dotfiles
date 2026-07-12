#!/bin/sh
while true; do
    xsetroot -name "$(date '+%a %b %d  %I:%M %p')"
    sleep $((60 - $(date +%S)))
done
