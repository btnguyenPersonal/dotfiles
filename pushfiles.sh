#!/bin/bash
cd ~/git/dotfiles
git fetch
git pull
cp -v ./ben/.xinitrc /home/ben/.xinitrc
cp -v ./ben/.zshrc /home/ben/.zshrc
cp -v ./ben/.zprofile /home/ben/.zprofile
cp -v ./ben/.vimrc /home/ben/.vimrc
cp -v ./nvim/init.vim /home/ben/.config/nvim/init.vim
if [ $(hostname) = 'benGreenLaptop' ]; then
  sed 's/size: 12/size: 8/' ./alacritty/alacritty.yml > /home/ben/.config/alacritty/alacritty.yml;
else
  sed 's/size: 8/size: 12/' ./alacritty/alacritty.yml > /home/ben/.config/alacritty/alacritty.yml;
fi
echo "'./alacritty/alacritty.yml -> /home/ben/.config/alacritty/alacritty.yml'"
cp -v ./nvim/coc-settings.json /home/ben/.config/nvim/coc-settings.json
cp -v ./tmux/.tmux.conf /home/ben/.tmux.conf
