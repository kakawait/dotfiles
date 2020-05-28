#!/usr/bin/env bash

# Volume notification: Pulseaudio and dunst
# inspired by https://gist.github.com/Liblor/b01549fef2d3d56247ff0292034a3ad6
# inspired by https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a

readonly NOTIFY_ID=506

get_volume() {
  pulseaudio-ctl full-status | cut -d' ' -f1
}

get_volume_icon() {
  if [ "$1" -lt 34 ]; then
    echo -n "audio-volume-low-symbolic"
  elif [ "$1" -lt 67 ]; then
    echo -n "audio-volume-medium-symbolic"
  elif [ "$1" -le 100 ]; then
    echo -n "audio-volume-high-symbolic"
  else
    echo -n "audio-volume-high-symbolic"
  fi
}

volume_notification() {
  local volume
  local volume_icon
  local bar
  
  volume=$(get_volume)
  volume_icon=$(get_volume_icon "$volume")
  bar=$(seq -s "─" $((volume / 3 + 2)) | sed 's/[0-9]//g')
  dunstify -r $NOTIFY_ID -u low -i "$volume_icon" "$bar"
}

mute_notification() {
  muted="$(pulseaudio-ctl full-status | cut -d' ' -f2)"
  if [ "$muted" == 'yes' ]; then
    dunstify -r $NOTIFY_ID -u low -i audio-volume-muted-symbolic mute
  else
    dunstify -r $NOTIFY_ID -u low -i "$(get_volume_icon "$(get_volume)")" unmute
  fi
}

case $1 in
  up)
    pulseaudio-ctl up
    volume_notification
    ;;
  down)
    pulseaudio-ctl down
    volume_notification
    ;;
  mute)
    pulseaudio-ctl mute
    mute_notification
    ;;
  *)
    echo "Usage: $0 up | down | mute"
    ;;
esac
