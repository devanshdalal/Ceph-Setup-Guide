#!/bin/bash

# ABOUT THIS FILE: used for getting the packages required for ceph installation frome internet[to be done only once during the cluster installation]

echo "Downloading"

# TO DO: before running this file run command : sudo apt-get install ceph ceph-mds and get the list of required packages and paste it in place of #PACKAGES in the below command

# Also ensure to add the required celph ppa to the current system's sources.list
# For example use this command to add ceph[giant] ppa to ubuntu 14.04.
# echo deb http://ceph.com/debian-giant/ trusty main | sudo tee /etc/apt/sources.list.d/ceph.list

# sudo apt-offline set --install-packages #PACKAGES --update apt.sig

sudo apt-offline set --install-packages btrfs-tools ceph ceph-common ceph-fs-common ceph-fuse ceph-mds cryptsetup-bin libaio1 libboost-thread1.54.0 libcephfs1 libcryptsetup4 libgoogle-perftools4 libjs-jquery libleveldb1 liblttng-ust-ctl2 liblttng-ust0 librados2 libradosstriper1 librbd1 libsnappy1 libtcmalloc-minimal4 libunwind8 liburcu1 python-blinker python-ceph python-flask python-itsdangerous python-jinja2 python-markupsafe python-pyinotify python-werkzeug xfsprogs --update apt.sig


sudo apt-offline get --bundle bundle apt.sig --proxy-host http://10.10.78.22:3128