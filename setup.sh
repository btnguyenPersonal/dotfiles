#!/bin/sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -o ~/.vimrc https://raw.githubusercontent.com/btnguyenPersonal/dotfiles/main/.vimrc
curl -o ~/.tmux.conf https://raw.githubusercontent.com/btnguyenPersonal/dotfiles/main/.tmux.conf
