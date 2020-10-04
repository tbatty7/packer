#!/bin/sh -x

echo "****************** Setting Hostname"
sleep 10
sudo hostnamectl set-hostname puppet-agent-2.test.org

echo "****************** Adding puppetmaster to /etc/hosts file"
echo 172.31.32.221 puppet-master.test.org | sudo tee -a /etc/hosts
sudo ping -c 5 puppet-master.test.org
sudo cat /etc/hosts

echo "****************** Updating apt package info..."
sudo apt-get update 
sudo apt-get upgrade -y
sleep 15

echo "****************** Installing Puppet"
sudo apt-get install puppet -y

echo "****************** Setting puppet master server"
sudo puppet config set server puppet-master.test.org --section main 

echo "****************** Checking config"
sudo cat /etc/puppet/puppet.conf
exit
