#!/bin/bash

#Chequeo de instalacino de bind9 y descargo e instalo si hace falta

if [ ! -f '/etc/init.d/bind9' ]; then
	aptitude install bind9;
fi

#Modifico el named.conf por el necesario para resolver el DNS
cp -f dns/named.conf /etc/bind/named.conf

#Modifico la direccion del DNS al que debo buscar en esta maquina
cp -f dns/resto/resolv.conf /etc/resolv.conf

#Cargo los archivos de configuracion para el bind9 para el DNS de resto
cp -f dns/resto/nsresto.named.conf.local /etc/bind/named.conf.local;
cp -f dns/resto/nsresto.named.conf.options /etc/bind/named.conf.options;

if [ ! -d '/etc/bind/zonas' ]; then
	mkdir /etc/bind/zonas;
fi
#Cargo las zonas que tiene definido el servidor.
cp -f dns/resto/db.resto /etc/bind/zonas/db.resto;
cp -f dns/resto/db.reverso.resto /etc/bind/zonas/db.reverso.resto;

#Cargo las zonas que se necesitan para busqueda inversa.
cp -f dns/resto/db.reverso.resto.bagdad-seul-bangkok /etc/bind/zonas/db.reverso.resto.bagdad-seul-bangkok;
cp -f dns/resto/db.reverso.resto.yakarta-damasco-jerusalem /etc/bind/zonas/db.reverso.resto.yakarta-damasco-jerusalem;
cp -f dns/resto/db.reverso.resto.ankara /etc/bind/zonas/db.reverso.resto.ankara;
cp -f dns/resto/db.reverso.resto.kuwait-taipei-singapur /etc/bind/zonas/db.reverso.resto.kuwait-taipei-singapur;
cp -f dns/resto/db.reverso.resto.moscu /etc/bind/zonas/db.reverso.resto.moscu;
cp -f dns/resto/db.reverso.resto.pekin /etc/bind/zonas/db.reverso.resto.pekin;
cp -f dns/resto/db.reverso.resto.tokyo /etc/bind/zonas/db.reverso.resto.tokyo;


echo 'Se han cargado exitosamente los archivos de configuracion';

#Reinicio el sistema.
/etc/init.d/bind9 restart
echo 'Se han cargado exitosamente los archivos de configuracion';
