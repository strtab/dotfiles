#!/usr/bin/env sh

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_DIR="$HOME/.config"

for d in $CURRENT_DIR/configs/*; do
    name=$(basename "$d")
    target="$CONFIG_DIR/$name"

    # skip if target already exists and it is NOT a symlink
    [ -e "$target" ] && [ ! -L "$target" ] && continue

    ln -sfn "$d" $CONFIG_DIR
done
