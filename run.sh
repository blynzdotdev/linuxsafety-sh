#!/bin/bash

sudo apt-get install ufw
sudo ufw allow 22/tcp
sudo ufw allow 5901:5910/tcp
sudo ufw allow http
sudo ufw allow https
sudo ufw enable

sudo apt install gpa

cd /etc/NetworkManager/conf.d
sudo touch 00-macrandomize.conf
sudo nano 00-macrandomize.conf
[device]
wifi.scan-rand-mac-address=yes

[connection]
wifi.cloned-mac-address=random
ethernet.cloned-mac-address=random
connection.stable-id=${CONNECTION}/${BOOT}

systemctl restart NetworkManager/conf

sudo hostnamectl set-hostname linuxmachine

sh -c "$(curl -sL https://nextdns.io/install)"

reboot
