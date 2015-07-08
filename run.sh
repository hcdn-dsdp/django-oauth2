#!/bin/bash
# ex30a.sh: "Colorized" version of ex30.sh.
DATE_FILE=$(date)
readonly OAUTH_PATH=/var/log/oauth
red='\E[1;31m'
green='\E[1;32m'
wipe="\033[1m\033[0m"

if [ -d "$OAUTH_PATH" ]; then
        nohup python manage.py runsslserver --certificate /usr/share/ca-certificates/hcdn/<CERT>.crt --key /usr/share/ca-certificates/hcdn/<CERT>.key --addrport <HOST>:<PORT> --noreload >> $OAUTH_PATH/nohup_`date +%Y-%m-%d`.out 2>&1&
else
	echo -e "$red"
	echo "***Ambiente no configurado***"
        echo "Ejecutar setenv.sh con permisos de root para configurar ambiente, luego ejecutar run.sh (sin permisos de root)."
fi

echo -e "$wipe"

