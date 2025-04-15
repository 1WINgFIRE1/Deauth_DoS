# Deauth Attack Script with MAC Spoofing

This Bash script automates a *Deauthentication Attack* with *MAC address spoofing* using aircrack-ng, macchanger, and basic Linux networking tools.

## What It Does

- Spoofs your wireless adapter's MAC address
- Enables monitor mode on your interface
- Sets the correct Wi-Fi channel
- Launches a *deauth attack* on a specified router (BSSID)
- Sends *fake deauthentication frames* to clients, forcing them off the network

## Tools Required

- airmon-ng
- airodump-ng
- aireplay-ng
- macchanger
- iwconfig

## How It Works

- Deauth frames are part of the 802.11 protocol and are *unauthenticated*.
- The script *spoofs the router’s MAC* as the sender of deauth frames.
- Clients believe the frames came from the real router and disconnect.

## Usage

```bash
chmod +x deauth_mac_spoof.sh
sudo ./deauth_mac_spoof.sh
