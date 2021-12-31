#!/bin/bash
cp ./ben/.xinitrc /home/ben/.xinitrc
cp ./ben/.zshrc /home/ben/.zshrc
cp ./ben/.zprofile /home/ben/.zprofile
cp ./ben/.vimrc /home/ben/.vimrc
cp ./nvim/init.vim /home/ben/.config/nvim/init.vim
if [ $(hostname) = 'benGreenLaptop' ]; then
  sed 's/size: 12/size: 8/' ./alacritty/alacritty.yml > /home/ben/.config/alacritty/alacritty.yml;
else
  sed 's/size: 8/size: 12/' ./alacritty/alacritty.yml > /home/ben/.config/alacritty/alacritty.yml;
fi
cp ./nvim/coc-settings.json /home/ben/.config/nvim/coc-settings.json
cp ./tmux/.tmux.conf /home/ben/.tmux.conf
