#!/bin/bash

echo "removing an osd"

#  Asssung the current user is cephuser and it has passwordless ssh and sudo access.

# take it out of the cluster so that Ceph can begin rebalancing and copying its data to other OSDs.
# result=$(ssh cephuser@$1 "/var/local/ | grep 'osd$2' ")
ceph osd tree --format json-pretty > _temposd.txt

value=$(python scripts/osdtreeparse.py _temposd.txt $1 osd.$2) 

echo $value


if [ "$value" == "True" ]; then
	echo "OSD Found and trying to remove now"
	ceph osd out $2

	sleep 7
	echo `ceph pg stat`
	str=$(ceph pg stat | grep -o 'active+degraded')
	while ! [ -z "$str" ] ; do
		sleep 5
		str=$(ceph pg stat | grep -o 'active+degraded')
		echo `ceph pg stat`
	done

	ssh cephuser@$1 "sudo stop ceph-osd id=$2"

	ceph osd crush remove osd.$2

	ceph auth del osd.$2

	ceph osd rm $2

	ssh cephuser@$1 "sudo rm -rf /var/local/osd$2"
	
	# doing later
	# ceph-deploy admin
	 
else
	echo "OSD NOT FOUND ON THIS HOST AND EXITING"
fi


rm _temposd.txt
