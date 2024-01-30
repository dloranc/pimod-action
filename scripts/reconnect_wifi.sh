#!/bin/bash

function reconnect() {
  if [[ $(ip link show wlan0 | grep "state UP") ]]; then
    wlan_status="UP"
  else
    wlan_status="DOWN"
  fi

  if [ "$wlan_status" == "DOWN" ]; then
    ip link set wlan0 up
  fi
}

while true; do
  sleep 60
  reconnect
done
