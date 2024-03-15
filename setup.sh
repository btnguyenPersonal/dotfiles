#!/bin/sh

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

curl -o ~/.vimrc https://raw.githubusercontent.com/btnguyenPersonal/dotfiles/main/.vimrc
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

mkdir -p ~/.config/kitty
curl -o ~/.config/kitty/kitty.conf https://raw.githubusercontent.com/btnguyenPersonal/dotfiles/main/kitty.conf

curl -o ~/.gitconfig https://raw.githubusercontent.com/btnguyenPersonal/dotfiles/main/.gitconfig

curl -o ~/.bashrc https://raw.githubusercontent.com/btnguyenPersonal/dotfiles/main/.bashrc
curl -o ~/.tmux.conf https://raw.githubusercontent.com/btnguyenPersonal/dotfiles/main/.tmux.conf
