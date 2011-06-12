#!/bin/bash

#Dar permisos de ejecucion a los Scripts

if [ $# -ne 1 ]
then
    path_propio=/home/distribuidos/Escritorio/grupo1/Scripts/
else
    path_propio=$1
fi

path=$path_propio

for i in $(ls $path) 
do    
    if [ -f $i ]
    then
	echo "Otorgando permisos de ejecucion al script" $i 
	chmod 777 $i
    fi
done

echo "Permisos otorgados a todos los scripts"

exit 0