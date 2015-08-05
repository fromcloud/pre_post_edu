#!/bin/bash

cli=cloudmonkey
tmp=/tmp/tempfile
cat $1  |
while read id apikey secret swift
do
	./set_cloudmonkey.sh $apikey $secret

	echo "deploy vm -- $id"
	$cli deployVirtualMachine \
		serviceofferingid=c504e367-20d6-47c6-a82c-183b12d357f2 \
		templateid=dc61305d-3520-44a1-bccc-7d7bb531bdc9 \
		zoneid=9845bd17-d438-4bde-816d-1b12f37d5080 \
		name=testsrv00 \
		displayname=testsrv00

	echo "destroy vm -- $id"
	$cli listVirtualMachines filter=id | grep id | awk '{print $2}' | tr -d '\"' > $tmp
	cat $tmp |
	while read vmid
	do
		$cli set profile server
		echo "destroy vm -- $id $vmid "
		$cli stopVirtualMachine id=$vmid
		$cli destroyVirtualMachine id=$vmid
	done

done
