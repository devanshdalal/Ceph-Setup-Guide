#!/bin/bash

echo "Creating a monitor"

#  Asssung the current user is cephuser and it has passwordless ssh and sudo access.


# creates a monitor on remote host. 
ceph-deploy mon create $1




