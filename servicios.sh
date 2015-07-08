#!/bin/bash
OAUTH_PATH=/var/log/oauth
RELEASE=1.3.0.0
LOG_FILE=oauthserver_`date +%Y-%m-%d`.log

pgrep -f '<HOST>:<PORT>' > /dev/null

if [ $? -ne 0 ]; then
	echo $(date) " Oauth caido, levantando..." >> $LOG_PATH/$LOG_FILE
	nohup python /opt/release/release$RELEASE/authenticator/oauth_toolkit/manage.py runsslserver  --certificate /usr/share/ca-certificates/hcdn/<CERT>.crt --key /usr/share/ca-certificates/hcdn/<CERT>.key --addrport <HOST>:<PORT> --noreload >> $OAUTH_PATH/$LOG_FILE 2>&1&
fi


