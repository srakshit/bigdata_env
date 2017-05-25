#!/bin/sh

#set janusgraph properties
/opt/janusgraph-properties.sh

#Waiting for cassandra and elastic search to start
sleep 10

#start janusgraph
$JANUSGRAPH_HOME/bin/gremlin-server.sh $JANUSGRAPH_HOME/conf/gremlin-server/rest-gremlin-server.yaml
