#!/bin/sh -x

# Update apt
apt-get -yqq update
export DEBIAN_FRONTEND=noninteractive

#Install Apache
apt-get -yqq install apache2
