#!/bin/bash
#uso: network_interfaces <router>

if [ "$#" -ne 1 ]
then
	echo "ERROR: Cantidad incorrecta de parametros"	
	echo "Uso: ./network_interfaces <router>"
	#codigo de retorno 1 para cantidad incorrecta de parametros
	exit 1
fi

router=$1

#borro las interfaces previamente definidas
sudo ifconfig eth2 down
sudo ifconfig eth2 up

#cargo las interfaces para este router
cd ./config/interfaces

if [ ! -r "$1" ]
then
	echo "No existe o no puede leerse archivo para el router especificado."
	#codigo de retorno 2 para archivo inexistente
	exit 2
fi

i=0
for interfaz in `cat "$router"`
do
	`echo "$interfaz" | sed "s/\(^[0-9,.]*\);\([0-9,.]*$\)/sudo ifconfig eth2:$i \1 netmask \2/"`
	let i=$i+1
done

exit 0
