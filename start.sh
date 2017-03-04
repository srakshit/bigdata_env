#docker stop $(docker ps -aq)

#docker rm $(docker ps -aq)

#docker rmi nifi-node
#docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
#docker rmi dockercloud/haproxy

#docker-compose up -d
#docker-compose scale nifi=3

docker-compose down
docker-compose build
docker-compose up -d
docker-compose scale nifi=3 kafka=3
