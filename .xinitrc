setxkbmap -option "ctrl:swap_lalt_lctl"
xset r rate 225 30

battery() {
  battery='/sys/class/power_supply/BAT0'

  if [ -d "$battery" ]; then
    if grep -q 'Charging' "$battery/status"; then
      echo -n '+'
    fi

    tr -d '\n' <"$battery/capacity"

    echo '%'
  fi
}

while true; do
  xprop -root -set WM_NAME " $(battery) | $(date '+%a %B %-d | %-I:%M %p')"
  sleep 15
done &

exec dwm
