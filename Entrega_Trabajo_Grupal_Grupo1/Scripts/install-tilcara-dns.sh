#!/bin/bash

#Chequeo de instalacino de bind9 y descargo e instalo si hace falta

if [ ! -f '/etc/init.d/bind9' ]; then
	aptitude install bind9;
fi

#Modifico el named.conf por el necesario para resolver el DNS
cp -f dns/named.conf /etc/bind/named.conf

#Modifico la direccion del DNS al que debo buscar en esta maquina
cp -f dns/tilcara/resolv.conf /etc/resolv.conf

#Cargo los archivos de configuracion para el bind9 para el DNS de tilcara
cp -f dns/tilcara/nstilcara.named.conf.local /etc/bind/named.conf.local;
cp -f dns/tilcara/nstilcara.named.conf.options /etc/bind/named.conf.options;

if [ ! -d '/etc/bind/zonas' ]; then
	mkdir /etc/bind/zonas;
fi
#Cargo las zonas que tiene definido el servidor.
cp -f dns/tilcara/db.tilcara /etc/bind/zonas/db.tilcara;
cp -f dns/tilcara/db.reverso.tilcara /etc/bind/zonas/db.reverso.tilcara;

#Cargo las zonas que se necesitan para busqueda inversa.
cp -f dns/tilcara/db.reverso.tilcara.bangkok-bagdag-seul /etc/bind/zonas/db.reverso.tilcara.bangkok-bagdag-seul;
cp -f dns/tilcara/db.reverso.tilcara.singapur-taipei-kuwait /etc/bind/zonas/db.reverso.tilcara.singapur-taipei-kuwait;
cp -f dns/tilcara/db.reverso.tilcara.tokyo /etc/bind/zonas/db.reverso.tilcara.tokyo;
cp -f dns/tilcara/db.reverso.tilcara.ankara /etc/bind/zonas/db.reverso.tilcara.ankara;
cp -f dns/tilcara/db.reverso.tilcara.moscu /etc/bind/zonas/db.reverso.tilcara.moscu;
cp -f dns/tilcara/db.reverso.tilcara.pekin /etc/bind/zonas/db.reverso.tilcara.pekin;
cp -f dns/tilcara/db.reverso.tilcara.damasco-yakarta-jerusalem /etc/bind/zonas/db.reverso.tilcara.damasco-yakarta-jerusalem;


echo 'Se han cargado exitosamente los archivos de configuracion';

#Reinicio el sistema.
/etc/init.d/bind9 restart
echo 'Se han cargado exitosamente los archivos de configuracion';
