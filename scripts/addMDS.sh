#!/bin/bash

echo "Adding a metadata server"

#  Asssung the current user is cephuser and it has passwordless ssh and sudo access.

ceph-deploy mds create $1


