#!/bin/bash

echo "Adding as osd"

#  Asssung the current user is cephuser and it has passwordless ssh and sudo access.
id=$(ceph osd tree | grep -c 'osd\.[0-9]\+');

# id=$((1+$id));

echo $id

ssh cephuser@$1 "sudo rm -rf /var/local/osd$id; sudo mkdir /var/local/osd$id"

ceph-deploy osd prepare $1:/var/local/osd$id
ceph-deploy osd activate $1:/var/local/osd$id


