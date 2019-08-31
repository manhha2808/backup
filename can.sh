#!/bin/bash

echo -e "Google Chrome \n"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i google-chrome-stable_current_amd64.deb

echo -e "Update and Upgrade \n"
sudo apt-get update

sudo apt-get upgrade -y

sudo apt-get install -y -f

echo -e "\n Vim, Variety, Fcitx \n"
sudo apt-get install -y vim variety fcitx-unikey

echo -e "\n Setting up library and install codec \n"

sudo apt install -y libdvdnav4 libdvdread4 gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly

sudo apt install -y ubuntu-restricted-extras

echo -e "Setting date time and click_action \n "

timedatectl set-local-rtc 1 --adjust-system-clock

gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

echo -e "\n Install Font \n"
sudo apt-get install -y ttf-mscorefonts-installer


echo -e "\n Install git \n"

sudo add-apt-repository ppa:git-core/ppa

sudo apt-get update

sudo apt-get install -y git

echo -e "\n Install Docker CE and Docker-compose \n"

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo docker run hello-world

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version

echo -e "\n Configure Git and Docker \n"

git config --global user.name "ManhHa"
git config --global user.email manhhabahn@gmail.com
git config credential.helper store

sudo groupadd docker
sudo usermod -aG docker $USER

echo -e "\n\n\n\n reboot "
