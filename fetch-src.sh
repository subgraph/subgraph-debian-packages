#!/bin/bash
set -e

base_url="https://www.github.com/subgraph"
packages="`cat package-list`"

mkdir -p tmp/;
cd tmp;
echo "fetching packages...";
for package in $packages;
do
 git clone $base_url/$package.git;
done
echo "Done fetching source code to tmp";
