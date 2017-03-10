#!/bin/sh

#set nifi server properties
sed -i -e "s|^nifi.web.http.host=.*$|nifi.web.http.host=$(hostname)|" $NIFI_HOME/conf/nifi.properties
sed -i -e "s|^nifi.cluster.node.address=.*$|nifi.cluster.node.address=$(hostname)|" $NIFI_HOME/conf/nifi.properties
sed -i -e "s|^nifi.remote.input.host=.*$|nifi.remote.input.host=$(hostname)|" $NIFI_HOME/conf/nifi.properties
sed -i -e "s|^nifi.remote.input.socket.port=.*$|nifi.remote.input.socket.port=8081|" $NIFI_HOME/conf/nifi.properties
sed -i -e "s|^nifi.cluster.is.node=.*$|nifi.cluster.is.node=true|" $NIFI_HOME/conf/nifi.properties
sed -i -e "s|^nifi.cluster.flow.election.max.candidates=.*$|nifi.cluster.flow.election.max.candidates=3|" $NIFI_HOME/conf/nifi.properties
sed -i -e "s|^nifi.cluster.node.protocol.port=.*$|nifi.cluster.node.protocol.port=8082|" $NIFI_HOME/conf/nifi.properties
sed -i -e "s|^nifi.zookeeper.connect.string=.*$|nifi.zookeeper.connect.string=$ZK_CONNECT_STRING|" $NIFI_HOME/conf/nifi.properties
