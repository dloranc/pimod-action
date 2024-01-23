#!/bin/bash

if [[ $(ip link show wlan0 | grep "state UP") ]]; then
  wlan_status="UP"
else
  wlan_status="DOWN"
fi

if [[ $(ip link show eth0 | grep "state UP") ]]; then
  eth_status="UP"
else
  eth_status="DOWN"
fi

if [ "$eth_status" == "DOWN" ]; then
  sudo ifconfig eth0 up
fi

if [ "$wlan_status" == "DOWN" ]; then
  if [ "$eth_status" == "DOWN" ]; then
    sudo ifconfig wlan0 up
  fi
fi
