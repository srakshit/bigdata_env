FROM srakshit/storm

MAINTAINER Subham Rakshit <subham.rakshit@hpe.com>

ADD ./storm-start.sh /opt/

RUN chown storm:storm -R /opt/storm-* \
    && chmod 754 /opt/storm-*

USER storm

CMD [ "sh", "-c", "/opt/storm-start.sh"]
