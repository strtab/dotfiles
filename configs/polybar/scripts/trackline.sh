#!/bin/sh

width=21
padding="    "
separator="•"

tmp_file="/tmp/trackline_step"
step=$(cat "$tmp_file" 2>/dev/null || echo 0)

status=$(playerctl status 2> /dev/null)
[ "$status" = "Paused" ] && echo "Paused" && exit 0
[ "$status" != "Playing" ] && echo "" && exit 0


artist=$(playerctl metadata artist 2>/dev/null | tr -d '\n')
title=$(playerctl metadata title 2>/dev/null | tr -d '\n')
#album=$(playerctl metadata album 2>/dev/null | tr -d '\n')

full="$artist $separator $title"


[ "${#full}" -le "$width" ] && echo "${full}" && exit 0

scroll="$full$padding"
[ "${#scroll}" -le "$step" ] && step=0 

part="${scroll:$step:$width}"
if [ "${#part}" -lt "$width" ]; then
  rest=$((width - ${#part}))
  part="$part${full:0:rest}"
fi
printf "\r%s" "$part"

step=$((step+1))
echo "$step" > "$tmp_file"
