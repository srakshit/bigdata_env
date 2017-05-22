#!/bin/sh

#set janusgraph properties
/opt/janusgraph-properties.sh

#start janusgraph
$JANUSGRAPH_HOME/bin/gremlin-server.sh $JANUSGRAPH_HOME/conf/gremlin-server/rest-gremlin-server.yaml
