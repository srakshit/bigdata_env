#!/bin/bash

#Get total number od active kafka containers
total_kafka_containers=$(docker ps | grep "\<kafka\>" | grep -v -- "-kafka" | wc -l)

#If total kafka started is 0 exit from the process
if [ $total_kafka_containers -eq 0 ]; then
   echo "Kafka containers not started. Exiting topic creation process"
   exit;
fi


#Get all active kafka container ids
kafka_containers=$(docker ps | grep "\<kafka\>" | grep -v -- "-kafka" | awk '{print $1}')

kafka_port=""
kafka_containers_active=""
sleep_time=10
timeout=0
START_TIMEOUT=600

echo "Waiting for kafka to start in all the containers"

while true; do
    total_kafka_started=0

    for container in $kafka_containers
    do
        #Somehow I couldn't pass env variable in grep. So had to grep env variable name to get the value from the container
        if [ -z $kafka_port ]; then
            kafka_port=$(docker exec --user root $container env | grep "KAFKA_PORT" | awk -F "=" '{print $2}')    
        fi
        
        #This should return port 9092 -- the port where kafka is listening to
        has_kafka_started=$(docker exec --user root $container netstat -lnt | grep "$kafka_port" | awk '{print $4}' | awk -F ":::" '{print $2}')
    
        #If the above command returns kafka port add 1 to the variable total_kafka_started
        if [ ! -z $has_kafka_started ];  then
            total_kafka_started=$((total_kafka_started + 1))
            
            #Report about whether kafka has started in the container once only
            if ! [[ "$kafka_containers_active" =~ "$container" ]] ; then
                echo "Kafka in $container started"
                kafka_containers_active="$container:$kafka_containers_active"
            fi
        fi
    done

        
    #If total kafka started is equal to total kafka containers spinned up then create kafka topics
    if [ $total_kafka_containers -gt 0 ] && [ $total_kafka_started -eq $total_kafka_containers ]; then
        container=$kafka_containers | awk '{print $1}'
        
        echo "Creating topic in container $container"
        
        docker exec --user root $container /bin/sh -c "/opt/kafka-create-topics.sh"
        exit;
    fi

    #Check every few seconds whether kafka has started in the containers. If it fails to start within the timeout period exit the topic creation process
    sleep $sleep_time
    timeout=$((sleep_time + timeout))
    echo "Waiting for all kafka containers to start. Elapsed time: ${timeout}s"

    if [ $timeout -ge $START_TIMEOUT ]; then
        echo "Failed to auto create topics";
        exit;
    fi

done
