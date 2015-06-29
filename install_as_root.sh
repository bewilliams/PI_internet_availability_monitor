#!/usr/bin/env bash
#this must be run as root

#prepare for installs
apt-get update
apt-get install python-software-properties make ant zip -y

#install elasticsearch
wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.3.9.deb
dpkg -i elasticsearch-1.3.9.deb
apt-get install -f

#install apache2 and kibana
apt-get install apache2 -y
cd /tmp
wget https://download.elastic.co/kibana/kibana/kibana-3.1.2.tar.gz
tar -xvf kibana-3.1.2.tar.gz
rm -rf /var/www/*
mv kibana-3.1.2/* /var/www

#set elasticsearch and apache to run at startup
update-rc.d elasticsearch defaults 95 10
update-rc.d apache2 defaults 95 10

#start elasticsearch and kibana
service elasticsearch start
service apache2 start