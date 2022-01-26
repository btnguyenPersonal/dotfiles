# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -ahlF --color=auto'
alias zip='zip -r'
alias al='alsamixer'
alias coms363='cd ~/git/classnotesS2021/coms363'
alias coms352='cd ~/git/classnotesS2021/coms352'
alias coms402='cd ~/git/classnotesS2021/coms402'
alias coms417='cd ~/git/classnotesS2021/coms417'
alias coms472='cd ~/git/classnotesS2021/coms472'
alias conia='iwctl station wlan0 connect "IASTATE"'
alias conhome='iwctl station wlan0 connect CenturyLink1230_5G --passphrase tfcda7343cb3'
alias getnet='iwctl station wlan0 get-networks'
alias scannet='iwctl station wlan0 get-networks'
alias initvim='nvim ~/.config/nvim/old_config.vim'
alias initlua='nvim ~/.config/nvim/init.lua'
alias initala='nvim ~/.config/alacritty/alacritty.yml'
alias battle='cd ~/git/classnotes/coms319/g07/battle-of-boats;npm start'
alias updategrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias zt='zathura'
alias sv='fzf --layout=reverse --height=9 | xargs -r nvim'
alias poefolder='cd /home/ben/.local/share/Steam/steamapps/compatdata/238960/pfx/drive_c/users/steamuser/Documents/My\ Games/Path\ of\ Exile'
alias p='sudo pacman'
alias mario='games/sm64-port/build/us_pc/sm64.us'
sshiastate() {
  if [ -z $TMUX ];
  then;
    ssh btnguyen@pyrite.cs.iastate.edu
  else;
    echo "Still in tmux"
  fi
}
_fix_cursor() {
  echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)
bindkey -v
KEYTIMEOUT=5
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'

      elif [[ ${KEYMAP} == main ]] ||
        [[ ${KEYMAP} == viins ]] ||
        [[ ${KEYMAP} = '' ]] ||
        [[ $1 = 'beam' ]]; then
                echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
rmswp() {
  rm ~/.vim/tmp/"$1".swp
}
topdf() {
  pandoc -f markdown -t pdf -o "$1".pdf *.md
}
savedotfiles() {
  cd /home/ben/git/dotfiles
  sudo ./pullfiles.sh
  git add .
  git commit -m "$1"
  git push
}
connet() {
  iwctl station wlan0 connect "$1" --passphrase "$2"
}
savenotes() {
  cd ~/git/classnotesS2021
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
export PROMPT='%B%F{blue}[%f%F{green}%~%f%F{blue}]%f%F{red}$%f%b '

bindkey "^[[3~" delete-char
bindkey "^[[F~" end-of-line
bindkey "^[[H~" beginning-of-line
bindkey "^[[3;5~" kill-word
bindkey "^H" backward-kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt appendhistory
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
if [ -z $TMUX ]; then; tmux; fi
