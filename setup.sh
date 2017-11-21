#!/bin/bash

sudo apt install -y git debhelper lintian diffoscope
sudo apt install -y dh-python dh-autoreconf dh-golang
sudo apt install -y pbuilder debootstrap devscripts config-package-dev
sudo apt install -y apt-cacher-ng cowbuilder git-buildpackage pristine-tar

# Remap deb.debian.org and sgos repos to https only outgoing connections when
# made by apt-cacher-ng
sudo cp configs/acng/* /etc/apt-cacher-ng/
sudo systemctl restart apt-cacher-ng

if [ -r /var/cache/pbuilder/base-stretch.cow  ]; then
    echo "You may want to remove the previous cowfile and try again:"
    echo "sudo rm -rf /var/cache/pbuilder/base-stretch.cow"
    exit
fi

DIST=stretch git-pbuilder create \
        --mirror=http://127.0.0.1:3142/deb.debian.org/debian \
        --basepath /var/cache/pbuilder/base-stretch.cow

sudo DIST=stretch /usr/sbin/cowbuilder --execute cow-setup.sh \
        --basepath /var/cache/pbuilder/base-stretch.cow \
        --save

