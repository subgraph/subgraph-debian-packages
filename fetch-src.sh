#!/bin/bash
set -e

base_url="https://www.github.com/subgraph"
packages="`cat package-list`"

mkdir -p tmp/;
cd tmp;
echo "fetching packages...";
for package in $packages;
do
 if [ ! -d $package ]; then
   git clone $base_url/$package.git;
 else
   echo "$package already cloned"
 fi
done
echo "Done fetching source code to tmp";
