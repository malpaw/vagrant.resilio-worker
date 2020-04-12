#!/bin/bash

apt-get update
apt-get -y upgrade
apt-get -y autoremove


WORK_DIR=/home/vagrant/workspace
SHARE_DIR=$WORK_DIR/share

echo installing resilio...
wget -nv https://download-cdn.resilio.com/2.6.4.1344/Debian/resilio-sync_2.6.4.1344-1_amd64.deb
dpkg -i resilio-sync_2.6.4.1344-1_amd64.deb

echo configuring resilio...
usermod -aG vagrant rslsync
usermod -aG rslsync vagrant
chmod g+rw $SHARE_DIR
cp $WORK_DIR/config.json /etc/resilio-sync/

echo enabling resilio...
systemctl enable resilio-sync
systemctl start resilio-sync

echo
echo all done.