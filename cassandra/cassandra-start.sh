#!/bin/sh

#set cassandra properties
/opt/cassandra-properties.sh

#start cassandra
$CASSANDRA_HOME/bin/cassandra -f
