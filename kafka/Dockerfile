FROM srakshit/kafka

MAINTAINER Subham Rakshit

ADD ./kafka-* /opt/

RUN chown kafka:kafka -R /opt/kafka*

USER kafka

EXPOSE 9092

CMD [ "sh", "-c", "/opt/kafka-start.sh"]
