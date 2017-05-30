# Conversion
------------

The conversion module consists of a wide variety of conversion possibilities.

## Source code


* [GitLab](https://gitlab.com/sapp/conversion)


## Command line


When the program is called a list of options become available to chose from of which conversions are available.

	java -jar conversion-0.0.1-jar-with-dependencies.jar 

    Usage: <main class> [options]
      Options:
     --help
       
       Default: true
    -embl2rdf
       input format is embl
       Default: false
    -fasta2rdf
       input format is fasta
       Default: false
    -genbank2rdf
       input format is genbank
       Default: false
    -gff2rdf
       input format is GFF3 to create GBOL files
       Default: false
    -gtf2rdf
       input format is GTF to create GBOL files
       Default: false
    -hdt2rdf, -rdf2hdt
       Conversion of RDF to HDT or HDT to RDF
       Default: false
    -merge
       Merging of HDT files
       Default: false
    -rdf2embl
       input format is RDF to create EMBL files
       Default: false
    -rdf2fasta
       input format is fasta
       Default: false
    -rdf2gtf
       input format is RDF to create GTF files
       Default: false
 
 