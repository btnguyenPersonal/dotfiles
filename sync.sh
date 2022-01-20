#!/bin/bash
cd ~/git/dotfiles
./pullfiles.sh
git diff
git add .
git commit -m "$(date)"
git push
