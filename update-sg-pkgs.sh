#!/bin/bash
set -e

export ARCH=amd64
export DIST=testing
packages="`cat package-list`"

echo "updating sources...";
cd tmp;
for package in $packages;
do
 cd $package && git checkout master;
 git pull
 cd ..;
done
echo "done updating sources";
