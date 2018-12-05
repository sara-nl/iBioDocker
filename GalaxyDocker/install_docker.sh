#!/bin/sh

add-tool-shed --url 'http://testtoolshed.g2.bx.psu.edu/' --name 'Test Tool Shed'

# Install Visualisation
install-biojs msa

#######################################################
################## Tool installation ##################

#######################################################
################## Quality control ####################

# Adding the tool definitions to the container
cp /source/QualityControl.yml $GALAXY_ROOT/QualityControl.yml
install-tools $GALAXY_ROOT/QualityControl.yml

#######################################################
################## Assembly ###########################

# Adding the tool definitions to the container
cp /source/GenomeAssembly.yml $GALAXY_ROOT/GenomeAssembly.yml
install-tools $GALAXY_ROOT/GenomeAssembly.yml

#######################################################
################## Genetic elements####################

# Adding the tool definitions to the container
cp /source/GeneticElements.yml $GALAXY_ROOT/GeneticElements.yml
install-tools $GALAXY_ROOT/GeneticElements.yml
## Excluding RNAmmer due to dependency issues

#######################################################
################## BLAST ##############################

cp /source/Blast.yml $GALAXY_ROOT/Blast.yml
install-tools $GALAXY_ROOT/Blast.yml

#### SWISSPROT
# wget ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_sprot.fasta.gz
# makeblastdb -dbtype prot -in uniprot_sprot.fasta
# Could also be done by using echo but then makeblastdb needs to be available in the docker image…
# cp -r /source/databases/blast/ /data/swissprot/
# cp /source/databases/blast/blastdb.loc /galaxy-central/tool-data/blastdb.loc

#######################################################
################## TODOs ##############################

cp /source/TODO.yml $GALAXY_ROOT/TODO.yml
install-tools $GALAXY_ROOT/TODO.yml

#######################################################
################## iBioSystems ########################

cp -r /source/welcome/ $GALAXY_CONFIG_DIR/web/
# Welcome.html

#######################################################
#######################################################
