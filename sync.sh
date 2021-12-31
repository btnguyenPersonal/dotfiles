#!/bin/bash
cd ~/git/dotfiles
./pullfiles.sh
git add .
git commit -m "$(date)"
git push
