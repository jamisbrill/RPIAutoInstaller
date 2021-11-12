
#!/bin/bash
#installs transmission , plex, pi hole, open media vault , mariadb . phpmyadmin ,mount hdd (may be redudant due to omv) , set ip .  


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
#sudo apt install transmission-daemon
#sudo systemctl stop transmission-daemon

#Set static ip
#Depends on network service ..... 

#install pi-hole
curl -sSL https://install.pi-hole.net | bash

echo "modify /etc/lighttpd.conf server.port = 8080, systemctl restart lighttpd "
sed 's/server.port = 80/server.port = 8080/' /etc/lighttpd.conf #this should modify the line to say port 8080 //== Needs TESTING. 


#Install MariaDB
sudo apt install mariadb-server
#install phpymadmin
sudo apt install phpmyadmin
sudo ln -s /usr/share/phpmyadmin /var/www/html


#mount hdd , add line to hdd 
#echo "/dev/disk/by-uuid/0328d1bd-ed55-4f32-bf1b-91aad6910b23          /srv/dev-disk-by-uuid-0328d1bd-ed55-4f32-bf1b-91aad6910b23      ext4    defaults,nofail,user_xattr,usrjquota=aquota.user,grpjquota=aquota.group,jqfmt=vfsv0,acl 0 2" >> /etc/fstab 
#manually mount it through the omv web gui as it will give it a new drive number etc. 




//modify static ip , default pi networking is removed with omv .... 
echo  "
network:
  ethernets:
    enx4ce173422ae4:
      addresses:
      - 192.168.1.50/24
      gateway4: 192.168.1.1
      accept-ra: true
      dhcp4: false
      dhcp6: true
      nameservers:
       addresses: [1.1.1.1, 8.8.8.8]

" >> 20-openmediavault-eth0.yaml   # needs finding location of file , as this will not write to anything. 

