#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

getCharging () {
  case "$(acpi | awk '{print $3}' | sed s/,//)" in
    "Charging")
      echo "^"
      ;;
    *)
      ;;
  esac
}

getBattery () {
  case "$(acpi | awk '{print $4}' | sed s/,//)" in
    "0%")
      echo "0000000000000000000000000000"
      ;;
    "1%")
      echo "1111111111111111111111111111"
      ;;
    "2%")
      echo "22222222222222222222222222222222"
      ;;
    "3%")
      echo "333333333333333333333333333333"
      ;;
    "4%")
      echo "444444444444444444444444444444444444444444"
      ;;
    "5%")
      echo "55555555555555555555555555555555555555555555555555"
      ;;
    "6%")
      echo "66666666666666666666666666666666666666"
      ;;
    "7%")
      echo "777777777777777777777777777777"
      ;;
    "8%")
      echo "888888888888888888888888888888"
      ;;
    "9%")
      echo "999999999999999999999999999999"
      ;;
    "10%")
      echo "10101010101010101010101011010101010101101010101010100010"
      ;;
    *)
      echo "$(acpi | awk '{print $4}' | sed s/,//)"
      ;;
  esac
}

status () {
  echo -n " M:$(amixer sget Master | grep Mono: | awk '{print $4}') H:$(amixer sget Headphone | grep "Front Left:" | awk '{print $5}') S:$(amixer sget Speaker | grep "Front Left:" | awk '{print $5}') | $(getCharging)$(getBattery) | $(date | awk '{print $1}') $(date '+%m-%d-%Y ')$(date '+%r' | awk '{print $1}' | sed s/:[0-9][0-9]$//) $(date '+%r' | awk '{print $2}') "
}

updateStatus () {
  while :; do
    xsetroot -name "$(status)"
    xset -r
    sleep 0.1
  done
}

xrandr
redshift -l 42:-93 &
updateStatus &
~/.fehbg &
compton -b
amixer set Headphone playback 87
amixer set Speaker playback 0
amixer set Master playback 50
xrdb ~/.Xresources
setxkbmap -option caps:swapescape
exec dwm
