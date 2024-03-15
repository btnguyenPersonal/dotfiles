. "$HOME/.cargo/env"
function linttest() {
    npm run lint && npm run test
}
function fproj() {
    grep -nr "$1" {src,test}
}
function ftest() {
    grep -nr "$1" test
}
function fsrc() {
    grep -nr "$1" src
}
function finder() {
    grep -nr "$1" .
}
alias ls='ls --color=auto'
alias ll='ls -alhF --color=auto'
alias grep='grep --color'
alias diff='diff --color'
alias zf='fzf --reverse --height=7 | xargs -r nvim'
alias vim='nvim'
alias vim='nvim'
