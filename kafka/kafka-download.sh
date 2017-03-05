#!/bin/bash

echo "Downloading and unzipping kafka-$KAFKA_VERSION"
mirror=$(curl --stderr /dev/null https://www.apache.org/dyn/closer.cgi\?as_json\=1 | jq -r '.preferred')
url="$mirror/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz"
curl $url | tar xz -C /opt 
