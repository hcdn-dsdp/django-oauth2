#!/bin/bash

readonly LOG_PATH=/var/log/oauth2
readonly USER=oauth-prod

if [ ! -d "$LOG_PATH" ]; then
	sudo mkdir $LOG_PATH
fi

sudo chown $USER $LOG_PATH -R
sudo chmod 700 $LOG_PATH -R 
