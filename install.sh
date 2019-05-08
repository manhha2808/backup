#!/bin/bash

#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y vim variety
sudo apt-get install -f
sudo apt install -y libdvdnav4 libdvdread4 gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly
timedatectl set-local-rtc 1 --adjust-system-clock
sudo apt install -y ubuntu-restricted-extras
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
sudo apt-get install -y ttf-mscorefonts-installer
