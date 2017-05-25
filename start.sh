#!/bin/bash

docker-compose down
docker-compose -f docker-compose-janusgraph.yml build
docker-compose -f docker-compose-janusgraph.yml up -d
#docker-compose scale nifi=3 kafka=3 storm-supervisor=3

#./kafka/check-kafka-started.sh
