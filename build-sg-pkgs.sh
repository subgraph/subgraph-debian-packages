#!/bin/bash
set -e

export DIST=stretch
packages="`cat package-list`"
gbp_args="buildpackage -us -uc --git-dist=${DIST}"

echo "building packages...";
cd tmp;
for package in $packages;
do
 cd $package && git checkout debian;
 gbp $gbp_args;
 cd ..;
done
echo "done building packages";
