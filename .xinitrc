setxkbmap -option ctrl:swaplalt_lctrl
setxkbmap -option caps:ctrl_modifier
setxkbmap -option ctrl:swap_lalt_lctl

xset r rate 225 30

while true; do
  statusbar
  sleep 15
done &

exec dwm
