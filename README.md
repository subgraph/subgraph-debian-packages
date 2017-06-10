# subgraph-debian-packages

Information and build status for SubgraphOS Debian packages

## Build overview

Subgraph Debian packages use ```git-buildpackage```. Upstream development is
generally in the ```master``` branch while the Debian packaging is in the
```debian``` branch. ```git-buildpackage``` is configured to build with
```git-pbuilder``` using a copy-on-write file stored in
```/var/cache/pbuilder/base-testing-amd64.cow```.


## Reproducibility

Most packages produced with this build process should be <a
href="https://wiki.debian.org/ReproducibleBuilds">reproducible</a>. Sample
hashes for package builds as of May 8th, 2017 in the ```sample-hashes``` file.

## Build environment setup process

Subgraph targets Debian testing and the build process should be performed on a
fully updated SubgraphOS or Debian Testing system.

To create the local git-pbuilder root, run the ```setup.sh``` provided in this
git repository:
```
bash -x setup.sh
```

To use the build root always set ```ARCH=amd64 DIST=testing``` before any
```git-buildpackage``` or other related commands.

## Package build process

To build any Subgraph Debian package the steps are uniform; simply pick a
project and run the following commands:
```
git clone https://www.github.com/subgraph/sgos_handbook
cd sgos_handbook/
git checkout debian
ARCH=amd64 DIST=testing gbp buildpackage -us -uc
```

All source code, .dsc files, .debs, and other output will be stored in
```/tmp/build-area/``` on your local file system.

### Sample build process for all packages

As an example, one may build all current Subgraph Debian packages:
```
bash ./setup.sh
bash ./fetch-src.sh
bash ./build-sg-pkgs.sh
```

All source code will be stored in ```./tmp/``` and all build output will be
placed in ```/tmp/build-area/```.


### Sample update process to build one package:

As an example, update the chroot, update all source repos and build usblockout:
```
bash ./update-chroot.sh
bash ./update-sg-srcs.sh
bash ./build-package.sh usblockout
```

### Build status

Each package is automatically built for each commit on the respective
```debian``` branch. 

[![Build Status](https://travis-ci.org/subgraph/base-files.svg?branch=debian)](https://travis-ci.org/subgraph/base-files): <a href="https://www.github.com/subgraph/base-files">base-files</a><br>
[![Build Status](https://travis-ci.org/subgraph/fw-daemon.svg?branch=debian)](https://travis-ci.org/subgraph/fw-daemon): <a href="https://www.github.com/subgraph/fw-daemon">fw-daemon</a><br>
[![Build Status](https://travis-ci.org/subgraph/gnome-session-subgraph.svg?branch=debian)](https://travis-ci.org/subgraph/gnome-session-subgraph): <a href="https://www.github.com/subgraph/gnome-session-subgraph">gnome-session-subgraph</a><br>
[![Build Status](https://travis-ci.org/subgraph/gnome-shell-extension-ozshell.svg?branch=debian)](https://travis-ci.org/subgraph/gnome-shell-extension-ozshell): <a href="https://www.github.com/subgraph/gnome-shell-extension-ozshell">gnome-shell-extension-ozshell</a><br>
[![Build Status](https://travis-ci.org/subgraph/gnome-shell-extension-torstatus.svg?branch=debian)](https://travis-ci.org/subgraph/gnome-shell-extension-torstatus): <a href="https://www.github.com/subgraph/gnome-shell-extension-torstatus">gnome-shell-extension-torstatus</a><br>
[![Build Status](https://travis-ci.org/subgraph/inotify.svg?branch=debian)](https://travis-ci.org/subgraph/inotify): <a href="https://www.github.com/subgraph/inotify">inotify</a><br>
[![Build Status](https://travis-ci.org/subgraph/libmacouflage.svg?branch=debian)](https://travis-ci.org/subgraph/libmacouflage): <a href="https://www.github.com/subgraph/libmacouflage">libmacouflage</a><br>
[![Build Status](https://travis-ci.org/subgraph/macouflage.svg?branch=debian)](https://travis-ci.org/subgraph/macouflage): <a href="https://www.github.com/subgraph/macouflage">macouflage</a><br>
[![Build Status](https://travis-ci.org/subgraph/macouflage-multi.svg?branch=debian)](https://travis-ci.org/subgraph/macouflage-multi): <a href="https://www.github.com/subgraph/macouflage-multi">macouflage-multi</a><br>
[![Build Status](https://travis-ci.org/subgraph/oz.svg?branch=debian)](https://travis-ci.org/subgraph/oz): <a href="https://www.github.com/subgraph/oz">oz</a><br>
[![Build Status](https://travis-ci.org/subgraph/paxrat.svg?branch=debian)](https://travis-ci.org/subgraph/paxrat): <a href="https://www.github.com/subgraph/paxrat">paxrat</a><br>
[![Build Status](https://travis-ci.org/subgraph/roflcoptor.svg?branch=debian)](https://travis-ci.org/subgraph/roflcoptor): <a href="https://www.github.com/subgraph/roflcoptor">roflcoptor</a><br>
[![Build Status](https://travis-ci.org/subgraph/sgos_handbook.svg?branch=debian)](https://travis-ci.org/subgraph/sgos_handbook): <a href="https://www.github.com/subgraph/sgos_handbook">sgos_handbook</a><br>
[![Build Status](https://travis-ci.org/subgraph/subgraph-apt-config.svg?branch=debian)](https://travis-ci.org/subgraph/subgraph-apt-config): <a href="https://www.github.com/subgraph/subgraph-apt-config">subgraph-apt-config</a><br>
[![Build Status](https://travis-ci.org/subgraph/subgraph-archive-keyring.svg?branch=debian)](https://travis-ci.org/subgraph/subgraph-archive-keyring): <a href="https://www.github.com/subgraph/subgraph-archive-keyring">subgraph-archive-keyring</a><br>
[![Build Status](https://travis-ci.org/subgraph/subgraph-defaults.svg?branch=debian)](https://travis-ci.org/subgraph/subgraph-defaults): <a href="https://www.github.com/subgraph/subgraph-defaults">subgraph-defaults</a><br>
[![Build Status](https://travis-ci.org/subgraph/subgraph-desktop-gnome.svg?branch=debian)](https://travis-ci.org/subgraph/subgraph-desktop-gnome): <a href="https://www.github.com/subgraph/subgraph-desktop-gnome">subgraph-desktop-gnome</a><br>
[![Build Status](https://travis-ci.org/subgraph/subgraph-environment-config.svg?branch=debian)](https://travis-ci.org/subgraph/subgraph-environment-config): <a href="https://www.github.com/subgraph/subgraph-environment-config">subgraph-environment-config</a><br>
[![Build Status](https://travis-ci.org/subgraph/subgraph-ferm-config.svg?branch=debian)](https://travis-ci.org/subgraph/subgraph-ferm-config): <a href="https://www.github.com/subgraph/subgraph-ferm-config">subgraph-ferm-config</a><br>
[![Build Status](https://travis-ci.org/subgraph/subgraph-gnupg-config.svg?branch=debian)](https://travis-ci.org/subgraph/subgraph-gnupg-config): <a href="https://www.github.com/subgraph/subgraph-gnupg-config">subgraph-gnupg-config</a><br>
[![Build Status](https://travis-ci.org/subgraph/subgraph-grub-config.svg?branch=debian)](https://travis-ci.org/subgraph/subgraph-grub-config): <a href="https://www.github.com/subgraph/subgraph-grub-config">subgraph-grub-config</a><br>
[![Build Status](https://travis-ci.org/subgraph/subgraph-landings.svg?branch=debian)](https://travis-ci.org/subgraph/subgraph-landings): <a href="https://www.github.com/subgraph/subgraph-landings">subgraph-landings</a><br>
[![Build Status](https://travis-ci.org/subgraph/subgraph_metaproxy.svg?branch=debian)](https://travis-ci.org/subgraph/subgraph_metaproxy): <a href="https://www.github.com/subgraph/subgraph_metaproxy">subgraph_metaproxy</a><br>
[![Build Status](https://travis-ci.org/subgraph/subgraph-networkmanager-config.svg?branch=debian)](https://travis-ci.org/subgraph/subgraph-networkmanager-config): <a href="https://www.github.com/subgraph/subgraph-networkmanager-config">subgraph-networkmanager-config</a><br>
[![Build Status](https://travis-ci.org/subgraph/subgraph-nm-never-autoconnect.svg?branch=debian)](https://travis-ci.org/subgraph/subgraph-nm-never-autoconnect): <a href="https://www.github.com/subgraph/subgraph-nm-never-autoconnect">subgraph-nm-never-autoconnect</a><br>
[![Build Status](https://travis-ci.org/subgraph/subgraph-os-apparmor-profiles.svg?branch=debian)](https://travis-ci.org/subgraph/subgraph-os-apparmor-profiles): <a href="https://www.github.com/subgraph/subgraph-os-apparmor-profiles">subgraph-os-apparmor-profiles</a><br>
[![Build Status](https://travis-ci.org/subgraph/subgraph-oz-profiles.svg?branch=debian)](https://travis-ci.org/subgraph/subgraph-oz-profiles): <a href="https://www.github.com/subgraph/subgraph-oz-profiles">subgraph-oz-profiles</a><br>
[![Build Status](https://travis-ci.org/subgraph/subgraph-pulse-config.svg?branch=debian)](https://travis-ci.org/subgraph/subgraph-pulse-config): <a href="https://www.github.com/subgraph/subgraph-pulse-config">subgraph-pulse-config</a><br>
[![Build Status](https://travis-ci.org/subgraph/subgraph-standard.svg?branch=debian)](https://travis-ci.org/subgraph/subgraph-standard): <a href="https://www.github.com/subgraph/subgraph-standard">subgraph-standard</a><br>
[![Build Status](https://travis-ci.org/subgraph/subgraph-tor-config.svg?branch=debian)](https://travis-ci.org/subgraph/subgraph-tor-config): <a href="https://www.github.com/subgraph/subgraph-tor-config">subgraph-tor-config</a><br>
[![Build Status](https://travis-ci.org/subgraph/usblockout.svg?branch=debian)](https://travis-ci.org/subgraph/usblockout): <a href="https://www.github.com/subgraph/usblockout">usblockout</a><br>
