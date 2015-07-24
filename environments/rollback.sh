#!/bin/bash
# ex30a.sh: "Colorized" version of ex30.sh.

red='\E[1;31m'
green='\E[1;32m'
wipe="\033[1m\033[0m"

usage="
$(basename "$0") [-h] <ambiente> <version_actual> <version_nueva> <host> <port> -- script para hacer rollback del Servidor de OAuth2.

where:
    -h                  muestra esta ayuda
    <ambiente>          {local, desa, prod}
    <version_actual>    versión que esta ejecutandose actualmente en el ambiente
    <version_nueva>     versión nueva que se ejecutará en el ambiente
    <host>              ejemplo: oauth2.hcdn.gob.ar
    <port>              ejemplo: 9000"

while getopts ':hs:' option; do
    case "$option" in
      h) echo -e "$red"
         echo "$usage"
         echo -e "$wipe"
         exit 0
         ;;
    esac
done
shift $((OPTIND - 1))
    
if [ ! $# -eq 5 ]; then
    echo -e "$red"
    echo "$usage"
    echo -e "$wipe"
    exit 0
fi

echo -e "$green"
echo "Comenzando a hacer el rollback en $1."
echo -e "$wipe"

ENVIRONMENT_PATH=/opt/oauth2
RELEASES_PATH=releases

ENVIRONMENT=$1
RELEASE_ACTUAL=release_$2
RELEASE_NUEVA=release_$3
HOST=$4
PORT=$5

#Acceder al directorio de ambientes
cd $ENVIRONMENT_PATH 


if [ ! -d "$RELEASE_ACTUAL" ]; then
	echo "No existe la version actual"
	exit 0
fi

if [ ! -d "$RELEASES_PATH/$RELEASE_ANTERIOR" ]; then 
	echo "La release a la cual quiere volver no existe"
	exit 0
fi


#Stop crontab 
sudo service cron stop

#Detener la aplicacion
sudo pkill -f $HOST:$PORT 

# Remuevo la version actual.
sudo rm -rf $RELEASE_ACTUAL

#Muevo la carpeta de la version anterior a de actual.
sudo mv $RELEASES_PATH/$RELEASE_ANTERIOR $RELEASE_ANTERIOR

#Editar oauth2.sh con VERSION nueva
sudo sed -i '12s/.*/    nohup python \/opt\/oauth2\/'$RELEASE_ANTERIOR'\/django-oauth2\/oauth_toolkit\/manage.py \\/' oauth2.sh

#Restart crontab
sudo service cron restart

#Remove de rollback.sh script 
sudo rm rollback.sh

echo -e "$green"
echo "El script ha terminado de realizar el deploy en $1."
echo -e "$wipe"

