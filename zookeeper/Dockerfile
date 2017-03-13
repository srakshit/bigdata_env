FROM srakshit/zookeeper

MAINTAINER Subham Rakshit

ADD ./zookeeper-* /opt/

RUN chown zoo:zoo -R /opt/zookeeper* \
    && chmod 754 /opt/zookeeper*

USER zoo

EXPOSE 2181

CMD [ "sh", "-c", "/opt/zookeeper-start.sh"]
