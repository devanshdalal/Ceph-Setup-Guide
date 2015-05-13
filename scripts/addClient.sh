#!/bin/bash

echo "Adding a Client"

#  Asssung the current user is cephuser and it has passwordless ssh and sudo access.

ceph-deploy admin $1

ssh cephuser@$1 "sudo chmod +r /etc/ceph/ceph.client.keyring;
				 sudo rbd map foo --pool rbd --name client.admin;
				 sudo mkdir /mnt/ceph-block-device;
				 sudo mount /dev/rbd/rbd/foo /mnt/ceph-block-device;"


# Finally, check the /mnt/ceph-block-device directry in home.


