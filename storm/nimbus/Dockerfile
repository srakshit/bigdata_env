FROM srakshit/storm

MAINTAINER Subham Rakshit

ADD ./storm-nimbus-start.sh /opt/
ADD ./storm-supervisord.conf /etc/storm-supervisord.conf

RUN chown storm:storm -R /opt/storm-* \
    && chown storm:storm -R /etc/storm-supervisord.conf \
    && chmod 754 /opt/storm-* \
    && chmod 754 /etc/storm-supervisord.conf

#USER storm

EXPOSE 3772 3773 6627 

CMD [ "sh", "-c", "/opt/storm-nimbus-start.sh"]
