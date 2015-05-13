#!/bin/bash
echo "transferring"

scp -r  bundle  cephuser@$1:~/

echo "scp done\n\n\n\n\n"

ssh cephuser@$1 "bash -s" < helper.sh

