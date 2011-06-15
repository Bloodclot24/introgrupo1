#!/bin/bash

# Instala WebServer, FtpServer, TelnetServer utilizando aptitude
# Se ejecuta en modo root

echo "Instalando servidor web(apache)"
aptitude install apache2

echo "Instalando servidor ftp"
aptitude install vsftpd

echo "Instalando servidor telnet"
aptitude install openbsd-inetd

echo "Servidores instalados"

exit 0
