#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -ahlF --color=auto'
alias zip='zip -r'
alias al='alsamixer'
alias coms342='cd ~/git/classnotes/coms342'
alias coms319='cd ~/git/classnotes/coms319'
alias coms474='cd ~/git/classnotes/coms474'
alias eng314='cd ~/git/classnotes/eng314'
alias conia='iwctl station wlan0 connect "IASTATE"'
alias conhome='iwctl station wlan0 connect CenturyLink1230_5G --passphrase tfcda7343cb3'
alias getnet='iwctl station wlan0 get-networks'
alias scannet='iwctl station wlan0 get-networks'
alias initvim='nvim ~/.config/nvim/init.vim'
alias initala='nvim ~/.config/alacritty/alacritty.yml'
alias battle='cd ~/git/classnotes/coms319/g07/battle-of-boats;npm start'
alias updategrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias zt='zathura'
alias sv='fzf --layout=reverse --height=9 | xargs -r nvim'
savedotfiles() {
  cd /home/ben/git/dotfiles
  git add .
  git commit -m "$1"
  git push
}
connet() {
  iwctl station wlan0 connect "$1" --passphrase "$2"
}
savenotes() {
  cd ~/git/classnotes
  git add .
  git commit -m "$1"
  git push
}
flashreader() {
  cd ~/git/FlashReader
  npm start
}

export LS_COLORS='di=1;33:*.html=1;31:*.json=0;35:*.jpg=1;35:*.jpeg=1;35:*.png=1;35:*.txt=0;33:*.java=0;34:*.css=4;32:*.c=0;31:*.js=1;94:*.cpp=0;31:*.pdf=1;95:*.docx=0;93:*.zip=0;91'
export PATH=$PATH:/home/ben/.scripts
export PROMPT='%B%F{green}[%~]%f%b%B%F{red}$%f%b '

bindkey "^[[3~" delete-char
bindkey "^[[F~" end-of-line
bindkey "^[[H~" beginning-of-line
bindkey "^[[3;5~" kill-word
bindkey "^H" backward-kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey 'kj' vi-cmd-mode
KEYTIMEOUT=10

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
