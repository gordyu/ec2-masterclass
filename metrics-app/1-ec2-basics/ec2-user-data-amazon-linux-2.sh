#!/bin/bash

########################################################
##### USE THIS FILE IS YOU LAUNCHED AMAZON LINUX 2 #####
########################################################

# get admin privileges
sudo su

# install httpd (Linux 2 version)
yum update                        # for Amazon Linux 2
yum install -y httpd.x86_64       # for Amazon Linux 2
systemctl start httpd.service     # for Amazon Linux 2
systemctl enable httpd.service    # for Amazon Linux 2