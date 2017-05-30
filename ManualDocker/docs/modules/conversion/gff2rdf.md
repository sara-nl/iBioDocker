GFF / GTF 2 RDF
------------

The GFF/GTF 2 RDF module is capable of converting existing GFF/GTF files into the RDF format

Source code
-----------
* [GitLab](https://gitlab.com/sapp/conversion)

Command line
------
	java -jar conversion-0.0.1-jar-with-dependencies.jar -gff2rdf  

	Usage: <main class> [options]
	  Options:
	    --help
	       
	  * -codon
	       Codon table used (for protein translation)
	       Default: 0
	  * -f, -fasta
	       input corresponding fasta file
	    -gbol
	       output HDT gbol file
	    -gff2rdf
	       GFF2 file input
	    -gff32rdf
	       GFF3 file input
	    -gtf2rdf
	       GTF file input
	    -reorder
	       Currently only GFF ordering as in Augustus is supported
	       (Gene/mRNA/Exon/Cds/mRNa/Exon/Cds...Gene.... This module tries... to reorder your file according to the partent
	       attribute
	       Default: false
	    -turtle
	       output turtle file if the input genome is to big for memory and/or HDT
	       (e.g. human)
	  * -id, identifier
	       Sample identifier
	
	  * required parameter


Galaxy
------
