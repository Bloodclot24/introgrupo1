#!/bin/bash

#Chequeo de instalacino de bind9 y descargo e instalo si hace falta

if [ ! -f '/etc/init.d/bind9' ]; then
	sudo aptitude install bind9;
fi

#Modifico el named.conf por el necesario para resolver el DNS
cp -f dns/named.conf /etc/bind/named.conf

#Modifico la direccion del DNS al que debo buscar en esta maquina
cp -f dns/root/resolv.conf /etc/resolv.conf

#Cargo los archivos de configuracion para el bind9 para el DNS root
cp -f dns/root/root.named.conf.local /etc/bind/named.conf.local;
if [ ! -d '/etc/bind/zonas' ]; then
	mkdir /etc/bind/zonas;
fi
#Cargo las zonas que tiene definido el servidor.
cp -f dns/root/db.jujuy /etc/bind/zonas/db.jujuy;


#Cargo las zonas que se necesitan para busqueda inversa.
cp -f dns/root/db.reverso /etc/bind/zonas/db.reverso;

echo 'Se han cargado exitosamente los archivos de configuracion';

#Reinicio el sistema.
/etc/init.d/bind9 restart
echo 'Se han cargado exitosamente los archivos de configuracion';
