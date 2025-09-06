#!/usr/bin/env sh

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for config in $CURRENT_DIR/*; do
    name=$(basename "$config")
    [ "$name" = "mklinks.sh" ] && continue
    [ "$name" = "synk.sh" ] && continue
    [ "$name" = "oh-my-zsh" ] && continue
    [ "$name" = "README.md" ] && continue
    [ "$name" = ".git" ] && continue
    ln -s "$config" ~/.config/
done
