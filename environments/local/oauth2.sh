#!/bin/bash

LOG_PATH=/var/log/oauth2
LOG_FILE=oauth2_`date +%d_%m_%Y`.log

pgrep -f 'localhost:9000' > /dev/null

if [ $? -ne 0 ]; then
        echo $(date) " OAuth2 caido, levantando..." >> $LOG_PATH/$LOG_FILE
        nohup python /opt/oauth2/release_0.0.0/django-oauth2/oauth_toolkit/manage.py \
        runsslserver --addrport localhost:9000 --noreload >> $LOG_PATH/$LOG_FILE 2>&1&
fi
