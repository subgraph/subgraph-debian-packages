#!/bin/bash
set -e

export DIST=testing
package="$1"
gbp_args="buildpackage -us -uc"

echo "building $package...";
cd tmp/$package 
git checkout debian;
gbp $gbp_args;
echo "done building package: $package";
