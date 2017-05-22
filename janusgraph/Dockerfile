FROM srakshit/janusgraph

MAINTAINER Subham Rakshit

COPY ./janusgraph-start.sh /opt/

RUN chown janusgraph:janusgraph -R /opt/janusgraph* \
    && chmod 754 /opt/janusgraph*

RUN chown janusgraph:janusgraph -R /opt/janusgraph/bin/* \
    && chmod 754 /opt/janusgraph/bin/*

USER janusgraph

EXPOSE 8182

CMD [ "sh", "-c", "/opt/janusgraph-start.sh"]
