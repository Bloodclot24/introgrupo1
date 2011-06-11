#!/bin/bash
#uso: network_interfaces <router>

router=$1

#borro las interfaces previamente definidas
#ifconfig eth2 down
#ifconfig eth2 up

#cargo las interfaces para este router
cd ./config/interfaces

i=1
for interfaz in `cat "$router"`
do
	#echo `sed 's/^\(*\);\(*\)$/ifconfig 'eth2.'$i \1 -netmask \2/' $interfaz`
	i=$i+1
done