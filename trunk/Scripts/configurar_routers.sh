#!/bin/bash

# Configura la tabla de ruteo del router pasado como parametro.
# Vacia la tabla de ruteo ya existente
# Habilita el forwarding de paquetes

if [ $# -ne 2 ]
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


bash network_interfaces.sh $1 $2

#Configurar rutas

cd ./config/tablas_de_ruteo/

echo "Configurando las rutas para el router" $i
old_IFS=$IFS;
IFS="
";

for i in `sed "s/^\([^;]*\);\([^;]*\);\([^;]*\);\([^;]*\);*$/\1 netmask \2 gw \3 metric \4/" $1`
do
	IFS=" ";
	echo "route add -net" $i
	route add -net $i
	IFS="
	";
done

IFS=$old_IFS;
echo "Rutas configuradas en el router" $1

#Habilitar el ruteo, permitir que las computadoras forwardeen paquetes

echo "Habilitando el forwarding de paquetes en el router" $1
sysctl -w net.ipv4.ip_forward=1
echo "Forwarding de paquetes habilitado"

sysctl -w net.ipv4.conf.all.accept_redirects=0
sysctl -w net.ipv4.conf.all.send_redirects=0
exit 0

