HISTCONTROL=ignoreboth
shopt -s histappend
export ESCDELAY=0
export PATH="~/.local/scripts:$PATH"
KEYTIMEOUT=5
alias ls='ls --color=auto'
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard --reverse"
export FZF_CTRL_T_COMMAND="git ls-files --cached --others --exclude-standard"
export FZF_ALT_C_COMMAND="git ls-files --cached --others --exclude-standard"
export LS_COLORS='no=00;37:fi=00:di=00;36:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
PROMPT_COMMAND=__prompt_command
__prompt_command() {
    local EXIT="$?"
    PS1=""

    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'

    if [ $EXIT != 0 ]; then
    PS1+="\n${Red}\u${RCol}"
    else
    PS1+="\n${Gre}\u${RCol}"
    fi

    PS1+="${RCol}@${BBlu}\h:${BYel}\w ${RCol}($(date -u +'%Y-%m-%dT%H:%M:%SZ'))\n${Pur}$ ${RCol}"
}
function ga () {
    git add :/
}
function gh () {
    git checkout "$@"
}
function gc () {
    git commit -am "$1"
}
function gp () {
    git push
}
function grs () {
    git restore --staged :/
}
function gr () {
    git restore :/
}
function g () {
    git pull
}
function gs () {
    git status
}
function gd () {
    git diff
}
function ll () {
    ls -alF "$@"
}

if [ -e ".venv/bin/activate" ]; then
    source .venv/bin/activate
fi
