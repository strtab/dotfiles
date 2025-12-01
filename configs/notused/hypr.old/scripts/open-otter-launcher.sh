#!/usr/bin/env bash

if hyprctl clients | grep -q "class: otter-launcher"; then
    hyprctl dispatch closewindow "class:^(otter-launcher)$"
else
  alacritty --class otter-launcher --config-file ~/.config/alacritty/otter-launcher.toml -e otter-launcher
fi
