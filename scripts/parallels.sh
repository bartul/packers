#!/bin/bash

# Bail if we are not running inside Parallels.
if [[ `facter virtual` != "parallels" ]]; then
    exit 0
fi

# Install the Parallels Tools
PARALLELS_TOOLS_ISO=/home/vagrant/prl-tools-lin.iso

mkdir -p /mnt/parallels
mount -o ro -o loop $PARALLELS_TOOLS_ISO /media/parallels

/media/parallels/install --install-unattended-with-deps --progress
umount /media/parallels

# Cleanup
rm $PARALLELS_TOOLS_ISO

