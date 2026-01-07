#!/bin/bash

chosen=$(printf "󱐋 Performance\n  Balanced\n󰌪 Power Saving" | rofi -dmenu -no-custom -theme-str '@import "colors.rasi"' -theme-str 'mainbox {children: [listview];}' -theme-str 'window {width: 210px;}' -theme-str 'listview {lines: 3;}' -theme-str 'element-text {padding: 0px;}' -theme-str 'configuration {show-icons: false; font: "AdwaitaMono Nerd Font 12";}' -p "Power Profile Menu")
case "$chosen" in
    "󱐋 Performance") powerprofilesctl set performance ;;
    "  Balanced") powerprofilesctl set balanced ;;
    "󰌪 Power Saving") powerprofilesctl set power-saver ;;
    *) exit 1 ;;
esac
