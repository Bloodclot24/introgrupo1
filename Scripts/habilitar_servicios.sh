#!/bin/bash

#Habilita los Servicios WebServer, FtpServer, TelnetServer dependiendo del parametro con el que se lo invoque

if [$# -ne 1]
then
    echo Error, cantidad de parametros invalida
    exit 1
fi

#Habilitando los servicios

if [$1 -eq WebServer]
then
    echo Habilitando servidor web
    service apache2 start
fi

if [$1 -eq FtpServer]
then
    echo Habilitando servidor ftp
    service vsftpd  start
fi

if [$1 -eq TelnetServer]
then
    echo Habilitando servidor telnet
    service openbsd-inetd start
fi

exit 0