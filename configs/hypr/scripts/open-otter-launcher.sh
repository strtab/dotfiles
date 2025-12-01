#!/usr/bin/env bash

export FZF_DEFAULT_OPTS='--color=fg:#797593,hl:#d7827e --color=spinner:#EA9A97'

if hyprctl clients | grep -q "class: otter-launcher"; then
    hyprctl dispatch closewindow "class:^(otter-launcher)$"
else
  alacritty --class otter-launcher --config-file ~/.config/alacritty/otter-launcher.toml -e "otter-launcher"
fi
