#!/bin/bash

/etc/init.d/cron start
CONF_FILE="/import/conf.yaml"
# Add the user
USERNAME=$(grep 'notebook_username' ${CONF_FILE} | sed 's/notebook_username: //g')
PASSWORD=$(grep 'notebook_password' ${CONF_FILE} | sed 's/notebook_password: //g')
useradd -d /import/ -p $PASSWORD $USERNAME
# Start the server
/usr/lib/rstudio-server/bin/rserver --server-daemonize 0
