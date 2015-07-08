#!/bin/bash

readonly OAUTH_PATH=/var/log/oauth
readonly USER=oauth-prod

if [ ! -d "$OAUTH_PATH" ]; then
	sudo mkdir $OAUTH_PATH
fi

sudo chown $USER $OAUTH_PATH -R
sudo chmod 700 $OAUTH_PATH -R 
