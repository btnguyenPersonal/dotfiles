#!/bin/sh
cd ~/git/dotfiles
git fetch
git --no-pager diff
git pull
cp -v ./ben/.xinitrc ${HOME}/.xinitrc
cp -v ./ben/.zshrc ${HOME}/.zshrc
cp -v ./ben/.zprofile ${HOME}/.zprofile
cp -v ./ben/.vimrc ${HOME}/.vimrc
cp -r ./nvim ${HOME}/.config/
if [ $(hostname) = 'benGreenLaptop' ]; then
  sed 's/size: 12/size: 10/' ./alacritty/alacritty.yml > ${HOME}/.config/alacritty/alacritty.yml;
else
  sed 's/size: 10/size: 12/' ./alacritty/alacritty.yml > ${HOME}/.config/alacritty/alacritty.yml;
fi
echo "'./alacritty/alacritty.yml -> ${HOME}/.config/alacritty/alacritty.yml'"
cp -v ./tmux/.tmux.conf ${HOME}/.tmux.conf
cp -v ./ssh/.sshvimrc ${HOME}/.sshvimrc
