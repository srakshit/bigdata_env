#!/bin/sh

#set kafka properties
echo "Setting Kafka properties"
/opt/kafka-properties.sh

#start kafka
echo "Starting Kafka"
exec $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
