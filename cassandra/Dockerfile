FROM srakshit/cassandra

MAINTAINER Subham Rakshit

ADD ./cassandra-* /opt/

RUN chown cassandra:cassandra -R /opt/cassandra* \
    && chmod 754 /opt/cassandra*

USER cassandra

EXPOSE 9160 9042

CMD [ "sh", "-c", "/opt/cassandra-start.sh"]
