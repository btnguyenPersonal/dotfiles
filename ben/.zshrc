alias ls='ls --color=auto'
alias ll='ls -ahlF --color=auto'
alias sv='fzf --layout=reverse --height=9 | xargs -r nvim'
alias clearswp='rm -f ~/.vim/tmp/{*,.*}'
alias initala='vim ~/.config/alacritty/alacritty.yml'
alias p='sudo pacman'
KEYTIMEOUT=5
set -o emacs
export LS_COLORS='di=1;33:*.html=1;31:*.json=0;35:*.jpg=1;35:*.jpeg=1;35:*.png=1;35:*.txt=0;33:*.java=0;34:*.css=4;32:*.c=0;31:*.js=1;94:*.cpp=0;31:*.pdf=1;95:*.docx=0;93:*.zip=0;91'
export PATH=$PATH:/home/ben/.scripts
export PROMPT="%B%F{blue}[%f%F{green}%~%f%F{blue}]%f%F{red}$%f%b "
export TERM=xterm-256color
bindkey "^[[3~" delete-char
bindkey "^[[3;5~" kill-word
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt appendhistory
