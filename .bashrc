KEYTIMEOUT=5
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard"
export FZF_CTRL_T_COMMAND="git ls-files --cached --others --exclude-standard"
export FZF_ALT_C_COMMAND="git ls-files --cached --others --exclude-standard"
export LS_COLORS='no=00;37:fi=00:di=00;35:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
export PATH="/usr/local/bin:/usr/bin:$PATH"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
function moc {
    npx mocha ./test/**/$1*.spec.* --exit
}
function updn {
    $(which npm) i $1@latest
}
function testbuild {
    NODE_ENV=test-mocha npx nyc --reporter=lcov npm run test:mocha -- --reporter min && npm run lint && echo -e "\n\e[1;32mAll Good!\e[0m\n\e[1;32mAll Good!\e[0m\n\e[1;32mAll Good!\e[0m\n\e[1;32mYou are a god at coding!\e[0m\n" || echo -e "\n\e[1;31mFail\e[0m\n\e[1;31mFail\e[0m\n\e[1;31mFail\e[0m\n\e[1;31mYou are so bad at coding\e[0m\n"
}
function ddoc {
    (cd $1 && $(which npm) run docker:$2)
}
function testcy {
    sed -ie "s/retries: 2,/&\renv: {\raccountPassword: \'v112233#\'\r},/" cypress.config.js && rm cypress.config.jse
}
__git_files () {
    _wanted files expl 'local files' _files
}
alias rmcarrot="sed -ie 's/\^//' package.json && rm package.jsone"
alias vi='nvim'
alias ls='ls --color=auto'
alias gl='git log --all --graph --decorate --oneline'

PROMPT_COMMAND=__prompt_command    # Function to generate PS1 after CMDs
__prompt_command() {
    local EXIT="$?"                # This needs to be first
    PS1=""

    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'

    if [ $EXIT != 0 ]; then
    PS1+="\n${Red}\u${RCol}"        # Add red if exit code non 0
    else
    PS1+="\n${Gre}\u${RCol}"
    fi

    PS1+="${RCol}@${BBlu}\h:${BYel}\w\n${Pur}$ ${RCol}"
}
function ga () {
    git add :/
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
	ls -al "$@"
}

function gld() {
    (
        local git_color_args="--color=always"
        local commits=$(git log --pretty=format:"%H")

        for commit in $commits; do
            git show $git_color_args --quiet $commit

            if [ "$commit" != "$(git rev-list --max-parents=0 HEAD)" ]; then
                echo ""
                git diff $git_color_args $commit^ $commit
            fi

            echo "--------------------------------------------------"
        done
    ) | less -R
}

alias say='espeak'
download() {
    python3 /usr/local/bin/youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" "$1"
}

export PATH="~/.local/scripts:$PATH"
export ESCDELAY=0
