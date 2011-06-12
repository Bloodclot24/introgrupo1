#!/bin/bash

# Configura la tabla de ruteo del router pasado como parametro.
# Vacia la tabla de ruteo ya existente
# Habilita el forwarding de paquetes

if [ $# -ne 1 ]
then
    echo "Error, cantidad de parametros invalida"
    exit 1
fi

#Detener servicios

service NetworkManager stop > /dev/null
service network-manager stop > /dev/null
service apparmor stop > /dev/null
service avahi-daemon stop > /dev/null

#Eliminar configuracion de rutas anteriores

echo "Eliminando rutas anteriores de la tabla de ruteo"
ip route flush default
echo "Tabla de ruteo limpia"

#Configurar rutas

echo "Configurando las rutas para el router" $i
old_IFS=$IFS;
IFS="
";

for i in `sed "s/^\([^;]*\);\([^;]*\);\([^;]*\);\([^;]*\);*$/\1 netmask \2 gw \3 metric \4/" /config/$1`
do
	IFS=" ";
	echo "route add -net" $i
	route add -net $i
	IFS="
	";
done

IFS=$old_IFS;
echo "Rutas configuradas en el router" $i

#Habilitar el ruteo, permitir que las computadoras forwardeen paquetes

echo "Habilitando el forwarding de paquetes en el router" $i
sysctl -w net.ipv4.ip_forward=1
echo "Forwarding de paquetes habilitado"

exit 0

