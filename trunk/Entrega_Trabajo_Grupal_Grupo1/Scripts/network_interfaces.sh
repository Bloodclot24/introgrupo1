#!/bin/bash
#uso: network_interfaces <router> <interfaz>

if [ "$#" -ne 2 ]
then
	echo "ERROR: Cantidad incorrecta de parametros"	
	echo "Uso: ./network_interfaces <router> <interfaz>"
	#codigo de retorno 1 para cantidad incorrecta de parametros
	exit 1
fi

router=$1
interface=$2

#borro las interfaces previamente definidas
ifconfig $interface down
ifconfig $interface up

#cargo las interfaces para este router
cd ./config/interfaces/

if [ ! -r "$1" ]
then
	echo "No existe o no puede leerse archivo para el router especificado."
	#codigo de retorno 2 para archivo inexistente
	exit 2
fi

i=0
for interfaz in `cat "$router"`
do
	`echo "$interfaz" | sed "s/^\([^;]*\);\([^;]*\)$/ifconfig $interface:$i \1 netmask \2/"`
	echo "$interfaz" | sed "s/^\([^;]*\);\([^;]*\)$/ifconfig $interface:$i \1 netmask \2/"
	let i=$i+1
done

exit 0
