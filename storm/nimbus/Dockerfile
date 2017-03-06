FROM nimmis/java-centos

MAINTAINER Subham Rakshit <subham.rakshit@hpe.com>

ENV STORM_HOME="/opt/storm" \
    STORM_VERSION="1.0.3"

ADD ./storm-* /opt/

RUN yum install -y net-tools python \
    && curl --silent -L -O https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 \
	&& chmod +x ./jq-linux64 \
	&& mv ./jq-linux64 /usr/bin/jq \
	&& chmod +x /opt/storm-download.sh \
	&& sleep 1 \
    && /opt/storm-download.sh \
	&& rm /opt/storm-download.sh \
	&& ln -s /opt/apache-storm-$STORM_VERSION $STORM_HOME \
	&& groupadd storm \
    && useradd -r -g storm storm \
	&& chown storm:storm -R /opt/storm*

USER storm

EXPOSE 3772 3773 6627

CMD [ "sh", "-c", "/opt/storm-start.sh"]
