#!/bin/sh -x

echo "****************** Setting Hostname"
sleep 10
sudo hostname

echo "****************** Adding puppetmaster to /etc/hosts file"
echo 172.31.32.221 puppet | sudo tee -a /etc/hosts
sudo ping -c 5 puppet
sudo cat /etc/hosts

echo "****************** Updating apt package info..."
sudo apt update 
sudo apt upgrade -y
sleep 15

echo "****************** Installing Puppet"
sudo apt install puppet -y

echo "****************** Setting puppet master server"
sudo puppet config set server puppet --section main 

echo "****************** Setting certificate name"
sudo puppet config set certname $(hostname) --section main

echo "****************** Checking config"
sudo cat /etc/puppet/puppet.conf
sudo ls /var/lib/puppet
exit
