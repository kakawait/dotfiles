#!/usr/bin/env bash

# Brightness notification: Brillo and dunst
# inspired by https://gist.github.com/Liblor/5ea857f44c1070ac3d9d0c99b9df71c1

readonly NOTIFY_ID=507

get_brightness() {
  /usr/bin/brillo | cut -d'.' -f1
}

get_brightness_icon() {
  if [[ "$1" -lt 34 ]]; then
    echo -n "display-brightness-low-symbolic"
  elif [[ "$1" -lt 67 ]]; then
    echo -n "display-brightness-medium-symbolic"
  elif [[ "$1" -le 100 ]]; then
    echo -n "display-brightness-high-symbolic"
  else
    echo -n "display-brightness-symbolic"
  fi
}

brightness_notification() {
  local brightness
  local brightness_icon
  local bar 
  
  brightness=$(get_brightness)
  brightness_icon=$(get_brightness_icon "$brightness")
  bar=$(seq -s "─" $((brightness / 3 + 2)) | sed 's/[0-9]//g')
  dunstify -r $NOTIFY_ID -u low -i "$brightness_icon" "$bar"
}

case $1 in
  up)
    pkexec /usr/bin/brillo -q -A 5 && pkexec /usr/bin/brillo -O
    brightness_notification
    ;;
  down)
    pkexec /usr/bin/brillo -q -U 5 && pkexec /usr/bin/brillo -O
    brightness_notification
    ;;
  *)
    echo "Usage: $0 up | down"
    ;;
esac
