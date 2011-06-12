#!/bin/bash

# Instala WebServer, FtpServer, TelnetServer utilizando aptitude
# Se ejecuta en modo root

echo "Instalando servidor web(apache)"
bash aptitude install apache2

echo "Instalando servidor ftp"
bash aptitude install vsftpd

echo "Instalando servidor telnet"
bash aptitude install openbsd-inetd

echo "Servidores instalados"

exit 0
