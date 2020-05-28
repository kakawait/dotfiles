#!/usr/bin/env bash

# Brightness notification: Brillo and dunst
# inspired by https://gist.github.com/Liblor/5ea857f44c1070ac3d9d0c99b9df71c1

readonly NOTIFY_ID=508
readonly INTERFACE=wlp61s0

get_wireless_state() {
  cat /sys/class/net/$INTERFACE/operstate
}

wireless_notification() {
  local wireless_status
  wireless_status="$(get_wireless_state)"
  # inverse logic since is a toggle
  if [ "$wireless_status" == "up" ]; then
    dunstify -r $NOTIFY_ID -u low -i "network-wireless-disconnected-symbolic" "disconnect wireless"
  else
    dunstify -r $NOTIFY_ID -u low -i "network-wireless-connected-symbolic" "connect wireless"
  fi
}

wireless_notification