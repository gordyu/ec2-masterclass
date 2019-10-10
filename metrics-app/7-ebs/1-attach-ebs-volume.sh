#!/bin/bash

# attach the EBS drive from the console to /dev/sdf

# list the volumes
lsblk

# check if the volume has any data
sudo file -s /dev/xvdf

# format the volume as ext4
sudo mkfs -t ext4 /dev/xvdf

# create a directory
sudo mkdir /myexternalvolume

# mount our EBS to our directory
sudo mount /dev/xvdf /myexternalvolume

# go to the directory and verify size and fre space
cd /myexternalvolume
sudo touch hello.txt
df -h .

# to unmount
umount /dev/xvdf

# setup EBS remount automatically

# backup fstab file
sudo cp /etc/fstab /etc/fstab.bak

# add an entry into our fstab file
cat /etc/fstab

# add this line to the bottom: 
# /dev/xvdf       /myexternalvolume    ext4    defaults,nofail        0       0
sudo yum install -y nano
sudo nano /etc/fstab
# exit nano by doing control + x

# verify for errors
sudo mount -a