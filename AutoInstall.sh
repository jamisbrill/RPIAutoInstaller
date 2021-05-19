#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

#Install PLEX
echo "installing plex"
sudo apt-get install apt-transport-https
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
sudo apt-get update
sudo apt install plexmediaserver

#install OMV
#Runs another script
sudo wget -O - https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/install | sudo bash


#Install Transmission
sudo apt install transmission-daemon
sudo systemctl stop transmission-daemon

#Set static ip
#Depends on network service ..... 

#install pi-hole
curl -sSL https://install.pi-hole.net | bash

echo "modify /etc/lighttpd.conf server.port = 8080, systemctl restart lighttpd "

#Install MariaDB
sudo apt install mariadb-server
#install phpymadmin
sudo apt install phpmyadmin
sudo ln -s /usr/share/phpmyadmin /var/www/html




