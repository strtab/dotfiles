#!/usr/bin/env sh

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

[ -e "~/.zshrc" ] && cp ~/.zshrc $CURRENT_DIR
[ -e "~/.zshenv" ] && cp ~/.zshenv $CURRENT_DIR
[ -e "~/.zprofile" ] && cp ~/.zprofile $CURRENT_DIR
[ -e "~/.xinitrc" ] && cp ~/.xinitrc $CURRENT_DIR

git add .
git commit -qm "backup $(date '+%Y-%m-%d')"
git push origin main
