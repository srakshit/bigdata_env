#!/bin/sh

total_topic=$(cat /opt/kafka-topic-configuration.json | jq '. | length')

cnt=0

zookeeper_connect=$(sed -n "/^zookeeper.connect=.*$/p" $KAFKA_HOME/config/server.properties | awk -F "=" '{print $2}')

#Loop through topic-configuration.json and create topics
while [ "$cnt" -lt "$total_topic" ]
do
    topic_name=$(cat /opt/kafka-topic-configuration.json | jq '.'[$cnt].name | tr -d '"')
    topic_partitions=$(cat /opt/kafka-topic-configuration.json | jq '.'[$cnt].partitions | tr -d '"')
    topic_replication_factor=$(cat /opt/kafka-topic-configuration.json | jq '.'[$cnt].replication_factor | tr -d '"')

    $KAFKA_HOME/bin/kafka-topics.sh --zookeeper $zookeeper_connect --create --topic $topic_name --replication-factor $topic_replication_factor --partitions $topic_partitions
    
    cnt=$((cnt+1))
done

