#!/bin/bash

########################################################
##### USE THIS FILE IS YOU LAUNCHED AMAZON LINUX 1 #####
########################################################

# get admin privileges
sudo su

# install httpd
yum update –y
yum install -y httpd24
service httpd start
chkconfig httpd on