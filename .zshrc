alias ls='ls --color=auto'
alias ll='ls -ahlF --color=auto'
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
export NVM_DIR=~/.nvm
export PATH="/usr/local/bin:/usr/bin:$PATH"
export GOOGLE_APPLICATION_CREDENTIALS=~/keys/cx-web-firestore-test-f2e0b635-e92db4de622f.json
export AWS_CA_BUNDLE=/etc/ssl/certs/pfg-ca-bundle.crt
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/pfg-ca-bundle.crt
export NODE_EXTRA_CA_CERTS=/etc/ssl/certs/pfg-ca-bundle.crt
export CURL_CA_BUNDLE=/etc/ssl/certs/pfg-ca-bundle.crt
export SSL_CERT_FILE=/etc/ssl/certs/pfg-ca-bundle.crt
# npm config set cafile /etc/ssl/certs/pfg-ca-bundle.crt
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  alias nvm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && nvm'
  alias node='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && node'
  alias npm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && npm'
fi
lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}
