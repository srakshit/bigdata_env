#!/bin/sh

kafka_container_id=$(docker ps -a | grep "kafka" | awk 'NR==1{print $1}')

docker exec --user root $kafka_container_id /bin/sh -c "/opt/kafka-create-topics.sh"
