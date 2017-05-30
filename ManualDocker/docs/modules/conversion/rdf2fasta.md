RDF 2 FASTA
------------

The RDF 2 FASTA module is capable of converting HDT files according to GBOL into various fasta files. Genome, Gene, Protein, tRNA, rRNA creation is currently supported


Source code
-----------
* [GitLab](https://gitlab.com/sapp/conversion)

Command line
------

	java -jar conversion-0.0.1-jar-with-dependencies.jar -rdf2fasta
	
	Usage: <main class> [options]
	  Options:
	    --help
	       
	    -gene
	       Gene file location
	    -genome
	       Genome file location
	  * -i, -input
	       input GBOL file
	    -protein
	       Protein file location
	    -rdf2fasta
	       GBOL to FASTA conversion
	       Default: true
	    -rrna
	       rRNA file location
	    -trna
	       tRNA file location
	
	  * required parameter

Galaxy
------
