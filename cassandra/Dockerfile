FROM srakshit/cassandra

MAINTAINER Subham Rakshit

ADD ./cassandra-* /opt/

RUN apk add --no-cache python python-dev

RUN chown cassandra:cassandra -R /opt/cassandra* \
    && chmod 754 /opt/cassandra*

USER cassandra

EXPOSE 9042

CMD [ "sh", "-c", "/opt/cassandra-start.sh"]
