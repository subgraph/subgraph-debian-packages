#!/bin/bash
set -e

export ARCH=amd64
export DIST=testing
packages="`cat package-list`"
gbp_args="buildpackage -us -uc"

echo "building packages...";
cd tmp;
for package in $packages;
do
 cd $package && git checkout debian;
 gbp $gbp_args;
 cd ..;
done
echo "done building packages";
