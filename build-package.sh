#!/bin/bash
set -e

export DIST=stretch
package="$1"
gbp_args="buildpackage -us -uc --git-dist=${DIST}"

echo "building $package...";
cd tmp/$package 
git checkout debian;
gbp $gbp_args;
echo "done building package: $package";
