#!/bin/bash

echo "destroying a monitor"

#  Asssung the current user is cephuser and it has passwordless ssh and sudo access.


# destroys the monitor on remote host. 
ceph-deploy mon destroy $1






