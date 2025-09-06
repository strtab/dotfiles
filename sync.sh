#!/usr/bin/env sh

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for file in .zshrc .zshenv .zprofile .xinitrc
do
  [ -f "$HOME/$file" ] && cp "$HOME/$file" "$CURRENT_DIR"
done

git add .
git commit -qm "backup $(date '+%Y-%m-%d')"
#git push origin main
