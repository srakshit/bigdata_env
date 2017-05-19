FROM srakshit/janusgraph

MAINTAINER Subham Rakshit

ADD ./janusgraph-* /opt/

RUN chown janusgraph:janusgraph -R /opt/janusgraph* \
    && chmod 754 /opt/janusgraph*

USER janusgraph

CMD [ "sh", "-c", "/opt/janusgraph-start.sh"]
