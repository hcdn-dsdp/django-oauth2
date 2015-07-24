#!/bin/bash

LOG_PATH=/var/log/oauth2
LOG_FILE=oauth2_`date +%d_%m_%Y`.log
HOST=oauth2.hcdn.gob.ar
PORT=9000

pgrep -f $HOST':'$PORT > /dev/null

if [ $? -ne 0 ]; then
        echo $(date) " OAuth2 caido, levantando..." >> $LOG_PATH/$LOG_FILE
        nohup python /opt/oauth2/release_0.0.0/django-oauth2/oauth_toolkit/manage.py \
        runsslserver --certificate /usr/share/ca-certificates/hcdn/oauth2.hcdn.gob.ar.crt \
        --key /usr/share/ca-certificates/hcdn/oauth2.hcdn.gob.ar.key \
        --addrport $HOST:$PORT --noreload >> $LOG_PATH/$LOG_FILE 2>&1&
fi
