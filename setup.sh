#!/bin/bash

sudo apt install -y git debhelper lintian diffoscope
sudo apt install -y pbuilder debootstrap devscripts config-package-dev
sudo apt install -y apt-cacher-ng cowbuilder git-buildpackage pristine-tar

ARCH=amd64 DIST=testing git-pbuilder create \
        --mirror=http://127.0.0.1:3142/ftp.ca.debian.org/debian
sudo ARCH=amd64 DIST=testing /usr/sbin/cowbuilder --execute cow-setup.sh \
        --architecture amd64 --basepath /var/cache/pbuilder/base-testing-amd64.cow \
        --save
