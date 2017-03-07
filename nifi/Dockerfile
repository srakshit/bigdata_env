FROM srakshit/nifi

MAINTAINER Subham Rakshit 

ADD ./nifi-properties.sh /opt/
ADD ./nifi-start.sh /opt/

RUN chown nifi:nifi -R /opt/nifi-* \
	&& chmod 754 /opt/nifi-*

USER nifi

CMD [ "sh", "-c", "/opt/nifi-start.sh"]
