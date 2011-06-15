#!/bin/bash

#Habilita los servicios de  WebServer, FtpServer, TelnetServer dependiendo del parametro con el que se lo invoque
#En caso de invocarselo sin parametros habilita los servicios de WebServer,FtpServer, TelnetServer.

if [ $# -gt 1 ]
then
    echo "Error, cantidad de parametros invalida"
    exit 1
fi

#Habilitando los servicios

if [ $1 -eq WebServer || $# -eq 0 ]
then
    echo "Habilitando servidor web"
    service apache2 start
fi

if [ $1 -eq FtpServer || $# -eq 0 ]
then
    echo "Habilitando servidor ftp"
    service vsftpd  start
fi

if [ $1 -eq TelnetServer || $# -eq 0 ]
then
    echo "Habilitando servidor telnet"
    service openbsd-inetd start
fi

exit 0