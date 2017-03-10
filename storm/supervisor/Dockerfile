FROM srakshit/storm

MAINTAINER Subham Rakshit

ENV APP_NAME=supervisor

ADD ./storm-supervisor-start.sh /opt/
ADD ./storm-supervisord.conf /etc/storm-supervisord.conf

RUN chown storm:storm -R /opt/storm-* \
    && chown storm:storm -R /etc/storm-supervisord.conf \
    && chmod 754 /opt/storm-* \
    && chmod 754 /etc/storm-supervisord.conf

#USER storm

EXPOSE 6700 6701 6702 6703 8000 

CMD [ "sh", "-c", "/opt/storm-supervisor-start.sh"]
