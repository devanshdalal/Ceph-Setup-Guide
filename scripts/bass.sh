#!/bin/bash


sleep 2
echo 'geew'
str=$(ceph pg stat | grep -o 'active+degraded')
echo $str
echo "ls"
echo '-z $str'

while (( !(-z $str) )) ; do
	ls | grep -o 'addOSD'
	sleep 1
	echo 'in'
done

