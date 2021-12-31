export EDITOR=nvim
export TERMINAL=alacritty
export BROWSER=chromium

if [ "$(tty)" = "/dev/tty1" ]; then

startx > /dev/null

fi
