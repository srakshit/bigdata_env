FROM nimmis/java-centos

MAINTAINER Subham Rakshit <subham.rakshit@hpe.com>

ENV NIFI_HOME="/opt/nifi" \
	HDF_VERSION="2.1.2.0" \
	NIFI_VERSION="1.1.0"

ADD ./nifi* /opt/

RUN mv /opt/nifi-${NIFI_VERSION}.${HDF_VERSION}-10/ ${NIFI_HOME} \
	&& sed -i -e "s|^nifi.ui.banner.text=.*$|nifi.ui.banner.text=Docker NiFi ${NIFI_VERSION}|" ${NIFI_HOME}/conf/nifi.properties \
	&& bash -c "mkdir -p ${NIFI_HOME}/{database_repository,flowfile_repository,content_repository,provenance_repository}" \
	&& groupadd nifi \
    	&& useradd -r -g nifi nifi \
	&& chown nifi:nifi -R ${NIFI_HOME} \
	&& chown nifi:nifi /opt/nifi* \
	&& chmod 754 /opt/nifi*

# These are the volumes (in order) for the following:
# 1) user access and flow controller history
# 2) FlowFile attributes and current state in the system
# 3) content for all the FlowFiles in the system
# 4) information related to Data Provenance
# You can find more information about the system properties here - https://nifi.apache.org/docs/nifi-docs/html/administration-guide.html#system_properties

VOLUME ["${NIFI_HOME}/database_repository", \
        "${NIFI_HOME}/flowfile_repository", \
        "${NIFI_HOME}/content_repository", \
        "${NIFI_HOME}/provenance_repository"]

USER nifi

EXPOSE 8080 8081 8082 9001

CMD [ "sh", "-c", "/opt/nifi-start.sh"]
