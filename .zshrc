alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias zf='fzf --reverse --height=7 | xargs -r nvim'
alias vim='nvim'
alias grep='grep --color'
function finder() {
    grep -nr "$1" "$2" | vim - -c "silent! /$1\\C" -c ":w! ~/.finder"
}
export FZF_DEFAULT_COMMAND='fd --type f --exclude .git'
KEYTIMEOUT=5
set -o emacs
export PROMPT="%B%F{blue}[%f%F{green}%~%f%F{blue}]%f%F{red}$%f%b "
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
export PATH="/usr/local/bin:/usr/bin:$PATH"
# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action
