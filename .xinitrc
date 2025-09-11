#!/bin/sh

session=${1:-i3}

case $session in
  i3|i3wm       ) exec i3;;
  c             ) exec cool-retro-term;;
  *             ) exec $1;;
esac
