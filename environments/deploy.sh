#!/bin/bash
# ex30a.sh: "Colorized" version of ex30.sh.

red='\E[1;31m'
green='\E[1;32m'
wipe="\033[1m\033[0m"

usage="
$(basename "$0") [-h] <ambiente> <version_actual> <version_nueva> <host> <port> -- script para hacer deploy del Servidor de OAuth2.

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
echo "Comenzando a hacer el deploy en $1."
echo -e "$wipe"

ENVIRONMENT_PATH=/opt/oauth2
RELEASES_PATH=releases

ENVIRONMENT=$1
RELEASE_ACTUAL=release_$2
RELEASE_NUEVA=release_$3
HOST=$4
PORT=$5

#Set usuario
USER=`whoami`

#Crear ambiente si no existe
if [ ! -d "$ENVIRONMENT_PATH" ]; then
    sudo mkdir $ENVIRONMENT_PATH
    sudo mkdir $ENVIRONMENT_PATH/$RELEASES_PATH
fi

#Acceder al directorio de ambientes
cd $ENVIRONMENT_PATH

#Stop crontab
sudo service cron stop

#Detener el sevidor de oauth2
sudo pkill -f $HOST:$PORT

#Mover version anterior a /releases
if [ -d "$RELEASE_ACTUAL" ]; then
    sudo mv $RELEASE_ACTUAL $ENVIRONMENT_PATH/$RELEASES_PATH/$RELEASE_ACTUAL
fi

#Crear nueva carpeta de la release actual (parametro)
sudo mkdir $RELEASE_NUEVA

#Acceder al directorio del nuevo release
cd $ENVIRONMENT_PATH/$RELEASE_NUEVA

#git clone del proyecto
sudo git clone https://github.com/DSDP/django-oauth2.git

#remove .git
sudo rm -rf django-oauth2/.git

#Make DB Dump
sudo mkdir dbdump
cd dbdump
sudo touch `date +\%Y-\%m-\%d`.sql
sudo chown $USER `date +\%Y-\%m-\%d`.sql
sudo pg_dump -U$USER oauth2 > `date +\%Y-\%m-\%d`.sql

#Volver al environment path
cd ..

#Move files by environment (desa, prod, local)
sudo mv django-oauth2/environments/$ENVIRONMENT/run.sh django-oauth2/run.sh
sudo mv django-oauth2/environments/$ENVIRONMENT/setenv.sh django-oauth2/setenv.sh
sudo mv django-oauth2/environments/$ENVIRONMENT/settings.py django-oauth2/oauth_toolkit/settings.py
sudo mv django-oauth2/environments/$ENVIRONMENT/oauth2.sh $ENVIRONMENT_PATH/oauth2.sh

#Setear environment
django-oauth2/setenv.sh

#remove environment folder
sudo rm -rf django-oauth2/environments

#Editar servicios.sh con VERSION nueva
sudo sed -i '10s/.*/    nohup python \/opt\/oauth2\/'$RELEASE_NUEVA'\/django-oauth2\/manage.py \\/' $ENVIRONMENT_PATH/oauth2.sh

#Dar permisos de ejecución luego de modificar
sudo chmod +x $ENVIRONMENT_PATH/oauth2.sh

#Restart crontab
sudo service cron restart

echo -e "$green"
echo "El script ha terminado de realizar el deploy en $1."
echo -e "$wipe"

