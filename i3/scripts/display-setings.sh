#!/bin/sh
intern=LVDS-1
extern=HDMI-1

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    xrandr --output "$intern" --off --output "$extern" --auto
fi


# xrandr --output HDMI-1 -r 75.00 --primary
# xrandr --output LVDS-1 --auto --off
