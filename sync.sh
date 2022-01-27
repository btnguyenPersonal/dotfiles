#!/bin/sh
cd ~/git/dotfiles
./pullfiles.sh
git --no-pager diff
git add .
git commit -m "$(date)"
git push
