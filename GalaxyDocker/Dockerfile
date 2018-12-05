# Galaxy - deepTools
#
# VERSION       0.2

FROM bgruening/galaxy-stable

MAINTAINER Jasper Koehorst, jasper.koehorst@wur.nl

ENV GALAXY_CONFIG_BRAND iBioSystems

WORKDIR /galaxy-central

ADD . /source

RUN chmod +x /source/install_docker.sh && \
    /source/install_docker.sh

# Mark folders as imported from the host.
VOLUME ["/export/", "/data/", "/var/lib/docker"]

# Expose port 80 (webserver), 21 (FTP server), 8800 (Proxy)
EXPOSE :80
EXPOSE :21
EXPOSE :8800

# Autostart script that is invoked during container start
CMD ["/usr/bin/startup"]
