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

audio() {
  amixer get Master | awk -F'[][]' 'END{ print $4":"$2 }'
}

brightness() {
  echo $(( ($(brightnessctl g) * 100) / $(brightnessctl m) ))
}

while true; do
  xprop -root -set WM_NAME " $(brightness) | $(audio) | $(battery) | $(date '+%a %B %-d | %-I:%M %p')"
  sleep 15
done &

exec dwm
