#!/bin/sh

#set janusgraph properties
/opt/janusgraph-properties.sh

#start janusgraph
$JANUSGRAPH_HOME/bin/janusgraph.sh start
