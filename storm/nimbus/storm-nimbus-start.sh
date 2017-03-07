#!/bin/sh

#set storm properties
echo "Setting Storm properties"
./opt/storm-properties.sh

#Staring supervisor
echo "Starting nimbus under supervision"
supervisord -c /etc/storm-supervisord.conf
