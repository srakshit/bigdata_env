#!/bin/sh

#set nifi properties
/opt/nifi-properties.sh

#start nifi
$NIFI_HOME/bin/nifi.sh run
