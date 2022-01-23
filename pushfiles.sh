#!/bin/bash
cd ~/git/dotfiles
git fetch
git pull
git --no-pager diff
cp -v ./ben/.xinitrc ${HOME}/.xinitrc
cp -v ./ben/.zshrc ${HOME}/.zshrc
cp -v ./ben/.zprofile ${HOME}/.zprofile
cp -v ./ben/.vimrc ${HOME}/.vimrc
cp -rv ./nvim ${HOME}/.config/
if [ $(hostname) = 'benGreenLaptop' ]; then
  sed 's/size: 12/size: 8/' ./alacritty/alacritty.yml > ${HOME}/.config/alacritty/alacritty.yml;
else
  sed 's/size: 8/size: 12/' ./alacritty/alacritty.yml > ${HOME}/.config/alacritty/alacritty.yml;
fi
echo "'./alacritty/alacritty.yml -> ${HOME}/.config/alacritty/alacritty.yml'"
cp -v ./tmux/.tmux.conf ${HOME}/.tmux.conf
