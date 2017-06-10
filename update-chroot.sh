#!/bin/bash
#
# Update the git-pbuilder root
#
set -e
sudo /etc/init.d/apt-cacher-ng start
ARCH=amd64 DIST=testing git-pbuilder update
