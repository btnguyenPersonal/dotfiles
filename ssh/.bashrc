alias ls='ls --color'
alias ll='ls -alF --color'
alias nvim='vim'
alias vi='vim -u ~/.sshvimrc'
alias clearswp='rm ~/.vim/tmp/*'

export EDITOR=/usr/bin/vim
export PS1="\[\e[1;32m\][\w]\[\e[m\]\[\e[1;31m\]$\[\em\] \[\e[00m\]"

if [ -z $TMUX ]; then tmux; fi
