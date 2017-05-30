HDT 2 RDF
------------

The HDT 2 RDF module is capable of converting HDT (header/dictionary/triple) files back to plain text RDF such that it can be loaded into SPARQL endpoints directly or used in other software that do not support HDT

Source code
-----------
* [GitLab](https://gitlab.com/sapp/conversion)

Command line
------
	java -jar conversion-0.0.1-jar-with-dependencies.jar -hdt2rdf

	The following options are required: -o, -output -i, -input 
	Usage: <main class> [options]
	  Options:
	    --help
	       
	    --prefix, -p
	       Prefix reducer: 'prefix@url prefi2x@url2'
	       Default: gbol@http://gbol.life# biopax@http://www.biopax.org/release/bp-level3.owl#
	    -format
	       RDF format (TURTLE/NT/...)
	       Default: TURTLE
	    -hdt2rdf
	       Converting HDT to RDF
	       Default: true
	  * -i, -input
	       input file (HDT/RDF)
	  * -o, -output
	       Output file (HDT/RDF)
	    -rdf2hdt
	       Converting RDF to HDT
	       Default: false
	
	  * required parameter


Galaxy
------
