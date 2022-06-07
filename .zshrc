alias ls='ls --color=auto'
alias ll='ls -ahlF --color=auto'
KEYTIMEOUT=5
set -o emacs
export LS_COLORS='di=1;34'
export PROMPT="%B%F{blue}[%f%F{green}%~%f%F{blue}]%f%F{red}$%f%b "
export PATH=/usr/local/bin:$PATH
bindkey "^[[3~" delete-char
bindkey "^[[3;5~" kill-word
bindkey "^H" backward-kill-word
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt appendhistory
. "$HOME/.cargo/env"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
