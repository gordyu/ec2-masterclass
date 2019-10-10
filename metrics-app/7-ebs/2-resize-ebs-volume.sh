#!/bin/bash

# see full tutorial at: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/recognize-expanded-volume-linux.html

# we'll use resize2fs command because we're using ext4 as the device formatting.

# use lsblk to check the disk size
lsblk

# see how the system sees our drive
df -h

# resize the partition
sudo resize2fs /dev/xvdf