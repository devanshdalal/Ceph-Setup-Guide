#!/bin/bash


echo "Entered"

cd ./bundle
sudo apt-get update
sudo dpkg -i *.deb


# sudo apt-get -y install -f


# checkin if ceph is installed
ceph --version

if [ $? = 0 ]; then echo "ceph installed!!"; else echo "FAILED!!!";fi

