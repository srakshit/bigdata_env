!#/bin/sh

sed -i -e "s|^nifi.web.http.host=.*$|nifi.web.http.host=$(hostname)|" /opt/nifi/conf/nifi.properties
sed -i -e "s|^nifi.cluster.node.address=.*$|nifi.cluster.node.address=$(hostname)|" /opt/nifi/conf/nifi.properties
sed -i -e "s|^nifi.remote.input.host=.*$|nifi.remote.input.host=$(hostname)|" /opt/nifi/conf/nifi.properties
sed -i -e "s|^nifi.remote.input.socket.port=.*$|nifi.remote.input.socket.port=8081|" /opt/nifi/conf/nifi.properties
sed -i -e "s|^nifi.cluster.is.node=.*$|nifi.cluster.is.node=true|" /opt/nifi/conf/nifi.properties
sed -i -e "s|^nifi.cluster.flow.election.max.candidates=.*$|nifi.cluster.flow.election.max.candidates=3|" /opt/nifi/conf/nifi.properties
sed -i -e "s|^nifi.cluster.node.protocol.port=.*$|nifi.cluster.node.protocol.port=8082|" /opt/nifi/conf/nifi.properties
sed -i -e "s|^nifi.zookeeper.connect.string=.*$|nifi.zookeeper.connect.string=zoo-master:2181|" /opt/nifi/conf/nifi.properties

cat /opt/nifi/conf/nifi.properties

/opt/nifi/bin/nifi.sh run
