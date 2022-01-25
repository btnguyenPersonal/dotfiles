alias ls='ls --color'
alias ll='ls -alF --color'
alias nvim='vim'

export EDITOR=/usr/bin/vim
export PS1="\[\e[1;32m\][\w]\[\e[m\]\[\e[1;31m\]$\[\em\] \[\e[00m\]"

echo -ne "\e[2 q"
if [ -z $TMUX ]; then tmux; fi
