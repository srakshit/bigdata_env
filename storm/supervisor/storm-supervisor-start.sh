#!/bin/sh

#set storm properties
echo "Setting Storm properties"
./opt/storm-properties.sh

#Staring supervisor
echo "Starting supervisor supervision"
supervisord -c /etc/storm-supervisord.conf
