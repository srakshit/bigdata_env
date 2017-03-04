FROM nimmis/java-centos

MAINTAINER Subham Rakshit <subham.rakshit@hpe.com>

ENV KAFKA_HOME="/opt/kafka" \
    KAFKA_VERSION="0.10.2.0" \
    SCALA_VERSION="2.10" \
    PATH=$PATH:$KAFKA_HOME/bin

ADD ./download-kafka.sh /opt/
ADD ./start-kafka.sh /opt/
ADD ./kafka-properties.sh /opt/
ADD ./kafka-create-topics.sh /opt/
ADD ./kafka-topic-configuration.json /opt/

RUN curl --silent -L -O https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 \
	&& chmod +x ./jq-linux64 \
	&& mv ./jq-linux64 /usr/bin/jq \
	&& chmod +x /opt/download-kafka.sh \
	&& sleep 1 \
    && /opt/download-kafka.sh \
	&& rm /opt/download-kafka.sh \
	&& ln -s /opt/kafka_$SCALA_VERSION-$KAFKA_VERSION $KAFKA_HOME \
	&& groupadd kafka \
    && useradd -r -g kafka kafka \
	&& chown kafka:kafka -R /opt/*kafka*

USER kafka

EXPOSE 9092

CMD [ "sh", "-c", "/opt/start-kafka.sh"]
