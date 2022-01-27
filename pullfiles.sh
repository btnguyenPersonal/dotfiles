#!/bin/sh
cp -v ${HOME}/.zshrc ./ben/.zshrc
cp -rv ${HOME}/.zsh ./
cp -v ${HOME}/.zprofile ./ben/.zprofile
cp -rv ${HOME}/.config/nvim ./
cp -v ${HOME}/.config/alacritty/alacritty.yml ./alacritty/alacritty.yml
cp -v ${HOME}/.tmux.conf ./tmux/.tmux.conf
cp -v ${HOME}/.vimrc ./ben/.vimrc
pacman -Q | sed 's/ .*$//' > ./packages.txt
