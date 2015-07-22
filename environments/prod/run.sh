#!/bin/bash
# ex30a.sh: "Colorized" version of ex30.sh.
DATE_FILE=$(date)
readonly LOG_PATH=/var/log/oauth2
red='\E[1;31m'
green='\E[1;32m'
wipe="\033[1m\033[0m"

if [ -d "$LOG_PATH" ]; then
        python manage.py runsslserver \
        --certificate /usr/share/ca-certificates/hcdn/oauth2.hcdn.gob.ar.crt \
        --key /usr/share/ca-certificates/hcdn/oauth2.hcdn.gob.ar.key \
        --addrport oauth2.hcdn.gob.ar:9000
else
	echo -e "$red"
	echo "***Ambiente no configurado***"
        echo "Ejecutar setenv.sh con permisos de root para configurar ambiente, luego ejecutar run.sh (sin permisos de root)."
fi

echo -e "$wipe"
