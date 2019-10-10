#!/bin/bash

########################################################
##### USE THIS FILE IS YOU LAUNCHED AMAZON LINUX 2 #####
########################################################

# upgrade machine
sudo yum update -y

# install java 8 jdk
sudo yum install -y java-1.8.0-openjdk-devel

# set java jdk 8 as default
sudo /usr/sbin/alternatives --config java
sudo /usr/sbin/alternatives --config javac

# verify java 8 is the default
java -version

# Download app
cd /home/ec2-user
wget https://github.com/simplesteph/ec2-masterclass-sampleapp/releases/download/v1.0/ec2-masterclass-sample-app.jar

# Test the app
java -Xmx700m -jar ec2-masterclass-sample-app.jar

# System D type of Configuration for Linux 2
sudo bash -c 'cat << \EOF > /etc/systemd/system/ec2sampleapp.service
[Unit]
Description=EC2 Sample App
After=network.target

[Service]
ExecStart=/usr/bin/java -Xmx700m -jar /home/ec2-user/ec2-masterclass-sample-app.jar
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF'

# apply across reboots
sudo systemctl enable ec2sampleapp.service # enable on boot
sudo systemctl start ec2sampleapp.service  # start now