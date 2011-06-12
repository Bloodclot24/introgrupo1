#!/bin/bash

#Habilita los servicios de  WebServer, FtpServer, TelnetServer dependiendo del parametro con el que se lo invoque
#En caso de invocarselo sin parametros habilita los servicios de WebServer,FtpServer, TelnetServer.

if [$# -gt 1]
then
    echo "Error, cantidad de parametros invalida"
    exit 1
else if	[$# -eq 0 ]
    then
	echo "Habilitando todos los servidores"
	service apache2 start
	service vsftpd start
	service openbsd/inetd start
	echo "El WebServer, FtpServer, TelnetServer se encuentran habilitados"
    fi
fi

#Habilitando los servicios

if [$1 -eq WebServer]
then
    echo "Habilitando servidor web"
    service apache2 start
fi

if [$1 -eq FtpServer]
then
    echo "Habilitando servidor ftp"
    service vsftpd  start
fi

if [$1 -eq TelnetServer]
then
    echo "Habilitando servidor telnet"
    service openbsd-inetd start
fi

exit 0