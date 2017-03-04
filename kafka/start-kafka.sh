#!/bin/sh

#set kafka properties
/opt/kafka-properties.sh

#start kafka
exec $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
