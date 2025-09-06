#!/usr/bin/env sh

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

[ -f "~/.zshrc" ] && cp ~/.zshrc $CURRENT_DIR
[ -f "~/.zshenv" ] && cp ~/.zshenv $CURRENT_DIR
[ -f "~/.zprofile" ] && cp ~/.zprofile $CURRENT_DIR
[ -f "~/.xinitrc" ] && cp ~/.xinitrc $CURRENT_DIR

git add .
git commit -qm "backup $(date '+%Y-%m-%d')"
git push origin main
