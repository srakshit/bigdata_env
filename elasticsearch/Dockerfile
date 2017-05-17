FROM srakshit/elasticsearch

MAINTAINER Subham Rakshit

ADD ./elasticsearch-* /opt/

RUN chown elasticsearch:elasticsearch -R /opt/elasticsearch* \
    && chmod 754 /opt/elasticsearch*

USER elasticsearch

EXPOSE 9200

CMD [ "sh", "-c", "/opt/elasticsearch-start.sh"]
