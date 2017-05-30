# Galaxy - deepTools
#
# VERSION       0.2

FROM bgruening/galaxy-stable

MAINTAINER Jasper Koehorst, jasper.koehorst@wur.nl

ENV GALAXY_CONFIG_BRAND iBioSystems

WORKDIR /galaxy-central

RUN add-tool-shed --url 'http://testtoolshed.g2.bx.psu.edu/' --name 'Test Tool Shed'

# Install Visualisation
RUN install-biojs msa

#######################################################
################## Tool installation ##################

#######################################################
################## Quality control ####################

# Adding the tool definitions to the container
ADD QualityControl.yml $GALAXY_ROOT/QualityControl.yml
RUN install-tools $GALAXY_ROOT/QualityControl.yml

#######################################################
################## Assembly ###########################

# Adding the tool definitions to the container
ADD GenomeAssembly.yml $GALAXY_ROOT/GenomeAssembly.yml
RUN install-tools $GALAXY_ROOT/GenomeAssembly.yml

#######################################################
################## Genetic elements####################

# Adding the tool definitions to the container
ADD GeneticElements.yml $GALAXY_ROOT/GeneticElements.yml
RUN install-tools $GALAXY_ROOT/GeneticElements.yml
## Excluding RNAmmer due to dependency issues

#######################################################
################## BLAST ##############################

ADD Blast.yml $GALAXY_ROOT/Blast.yml
RUN install-tools $GALAXY_ROOT/Blast.yml

#### SWISSPROT
# wget ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_sprot.fasta.gz
# makeblastdb -dbtype prot -in uniprot_sprot.fasta
# Could also be done by using echo but then makeblastdb needs to be available in the docker image…
# ADD ./databases/blast/ /data/swissprot/
# ADD ./databases/blast/blastdb.loc /galaxy-central/tool-data/blastdb.loc

#######################################################
################## TODOs ##############################

ADD TODO.yml $GALAXY_ROOT/TODO.yml
RUN install-tools $GALAXY_ROOT/TODO.yml

#######################################################
################## iBioSystems ########################

#ENV GALAXY_CONFIG_BRAND=“iBioSystems”
# Welcome.html

#######################################################
#######################################################

# Mark folders as imported from the host.
VOLUME ["/export/", "/data/", "/var/lib/docker"]

# Expose port 80 (webserver), 21 (FTP server), 8800 (Proxy)
EXPOSE :80
EXPOSE :21
EXPOSE :8800

# Autostart script that is invoked during container start
CMD ["/usr/bin/startup"]
