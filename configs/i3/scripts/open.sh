#!/usr/bin/env sh

target=${1:-$HOME}

exec kitty --class kitty-floating \
  --config $HOME/.config/kitty/kitty-floating.conf \
  --config $HOME/.config/kitty/theme-floating.conf \
  ranger $target
