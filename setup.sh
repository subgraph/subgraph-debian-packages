#!/bin/bash

sudo apt install -y git debhelper lintian diffoscope
sudo apt install -y dh-python2 dh-autoreconf
sudo apt install -y pbuilder debootstrap devscripts config-package-dev
sudo apt install -y apt-cacher-ng cowbuilder git-buildpackage pristine-tar

DIST=testing git-pbuilder create \
        --mirror=http://127.0.0.1:3142/ftp.ca.debian.org/debian
sudo DIST=testing /usr/sbin/cowbuilder --execute cow-setup.sh \
        --basepath /var/cache/pbuilder/base-testing.cow \
        --save
