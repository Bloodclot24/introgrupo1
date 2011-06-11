#!/bin/bash
#uso: network_interfaces <router>

router=$1

#borro las interfaces previamente definidas
sudo ifconfig eth2 down
sudo ifconfig eth2 up

#cargo las interfaces para este router
cd ./config/interfaces

i=0
for interfaz in `cat "$router"`
do
	echo `echo "$interfaz" | sed "s/\(^[0-9,.]*\);\([0-9,.]*$\)/sudo ifconfig eth2:$i \1 netmask \2/"`
	i=$i+1
done
