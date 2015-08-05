#!/bin/bash

cli=cloudmonkey
tmp=/tmp/tempfile
cat $1 |
while read id apikey secret swift
do
	./set_cloudmonkey.sh $apikey $secret

	echo "destory waf -- $id"
	$cli set profile waf
	$cli listWAFs filter=id | grep id | awk '{print$2}' | tr -d '\"' > $tmp
	cat $tmp |
	while read wafid
	do
		echo "destory waf -- $id $wafid"
		$cli deleteWAF id=$wafid
	done

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

	echo "destory ip -- $id"
	$cli listPublicIpAddresses issourcenat=false filter=id | grep id | awk '{print$2}' | tr -d '\"' > $tmp
	cat $tmp |
	while read ipid
	do
		echo "destory ip -- $id $ipid"
		$cli disassociateIpAddress id=$ipid
	done

	echo "destory pf -- $id"
    $cli listPortForwardingRules filter=id | grep id | awk '{print$2}' | tr -d '\"' > $tmp
	cat $tmp |
	while read pfid
	do
		echo "destory pf -- $id $pfid"
		$cli deletePortForwardingRule id=$pfid
	done


	echo "destory fw -- $id"
    $cli listFirewallRules filter=id | grep id | awk '{print$2}' | tr -d '\"' > $tmp
	cat $tmp |
	while read fwid
	do
		echo "destory fw -- $id $fwid"
		$cli disassociateIpAddress id=$fwid
	done


	echo "destory disk -- $id"
	$cli listVolumes filter=id | grep id | awk '{print$2}' | tr -d '\"' > $tmp
	cat $tmp |
	while read diskid
	do
		echo "destory disk -- $id $diskid"
		$cli deleteVolume id=$diskid
	done

	echo "destory snapshot -- $id"
	$cli listSnapshots filter=id | grep id | awk '{print$2}' | tr -d '\"' > $tmp
	cat $tmp |
	while read snid
	do
		echo "destory snapshot -- $id $snid"
		$cli deleteSnapshot id=$snid
	done

	echo "destory tmpl -- $id"
	$cli listTemplates filter=id | grep id | awk '{print$2}' | tr -d '\"' > $tmp
	cat $tmp |
	while read tmid
	do
		echo "destory tmpl -- $id $tmid"
		$cli deleteTemplate id=$tmid
	done
	
	echo "destory lb -- $id"
	$cli set profile lb
	$cli listLoadBalancers filter=id | grep id | awk '{print$2}' | tr -d '\"' > $tmp
	cat $tmp |
	while read lbid
	do
		echo "destory lb -- $id $lbid"
		$cli deleteLoadBalancer id=$lbid
	done

	echo "destory nas -- $id"
	$cli set profile nas
	$cli listVolumes status=online filter=id | grep id | awk '{print$2}' | tr -d '\"' > $tmp
	cat $tmp |
	while read nasid
	do
		echo "destory nas -- $id $nasid"
		$cli deleteVolume id=$nasid
	done


	echo "destory swift -- $id"
	./delete_swift.sh $id $swift
done

#delete_storage
