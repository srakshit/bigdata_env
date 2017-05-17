#!/bin/bash

docker-compose down
docker-compose build
docker-compose up -d
#docker-compose scale nifi=3 kafka=3 storm-supervisor=3

#./kafka/check-kafka-started.sh
