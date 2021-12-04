#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
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
alias battle='cd ~/git/classnotes/coms319/g07/battle-of-boats;npm start'
alias snd='amixer set Headphone playback 50; amixer set Speaker playback 0; amixer set Master 87'
alias mute='amixer set Headphone playback 0; amixer set Speaker playback 0; amixer set Master 0'
alias asnd='amixer set Headphone playback 0; amixer set Speaker playback 87; amixer set Master playback 87'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
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
  cd ~/git/classnotes
  git add .
  git commit -m "$1"
  git push
}
flashreader() {
  cd ~/git/FlashReader
  npm start
}

wmname compiz
export LS_COLORS='di=1;33:*.html=1;31:*.json=0;35:*.jpg=1;35:*.jpeg=1;35:*.png=1;35:*.txt=0;33:*.java=0;34:*.css=4;32:*.c=0;31:*.js=1;94:*.cpp=0;31:*.pdf=1;95:*.docx=0;93:*.zip=0;91'
export PS1="\[\e[1;36m\][\w]\[\e[m\]\[\e[1;31m\]⚡\[\e[m\]"
export PS2="\[\e[1;31m\] \[\e[m\]"
stty werase \^H

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
