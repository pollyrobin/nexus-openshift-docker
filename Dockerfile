FROM sonatype/nexus:2.13.0-01

MAINTAINER Siamak Sadeghianfar <ssadeghi@redhat.com>

ENV SONATYPE_WORK /sonatype-work

USER root
COPY conf/nexus.xml ${SONATYPE_WORK}/conf/nexus.xml
RUN chown -R nexus:nexus ${SONATYPE_WORK} && \
    chown -R nexus:nexus /opt/sonatype/nexus && \
    #chmod -R ugo+rw ${SONATYPE_WORK} 
    chmod -R 777 ${SONATYPE_WORK} && \
    chmod -R 777 /opt/sonatype/nexus
USER nexus
#CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
