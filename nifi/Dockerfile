FROM srakshit/nifi

MAINTAINER Subham Rakshit 

ADD ./nifi-properties.sh /opt/
ADD ./nifi-start.sh /opt/

RUN chown nifi:nifi -R /opt/nifi-* \
	&& chmod 754 /opt/nifi-*

USER nifi

EXPOSE 8080 8081 8082 9001

CMD [ "sh", "-c", "/opt/nifi-start.sh"]
