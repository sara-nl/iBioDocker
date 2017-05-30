>This Section has been created to provide a guideline on reproducing the results from the following articles


Protein domain architectures provide a fast, efficient and scalable alternative to sequence-based methods for comparative functional genomics
--------

### Obtaining the software
The platform can be downloaded and installed using the installation procedure as shown on the left under the 'Installation' section or install the following modules independently.

```
git clone https://gitlab.com/sapp/genbank2rdf
Followed by running the install.sh script inside the genbank2rdf folder
git clone https://gitlab.com/sapp/genecaller
Followed by running the install.sh script inside the genecaller folder
git clone https://gitlab.com/sapp/interproscan 
Followed by running the install.sh script inside the interproscan folder
```

### Annotation of the genomes
To annotate the genomes the EMBL files can be retrieved from the ENA website.
For example GCA_000019445 in the paper links to the following website [http://www.ebi.ac.uk/ena/data/view/GCA_000019445](). In the Chromosomes section the entire genome can be retrieved using the **TEXT** view.

Once the genome is downloaded re-annotation can be initiated either through the complete SAPP framework or through the specific modules installed above.

#### Conversion

To convert the genome the genbank2rdf module can be started from within the folder by executing the following line:

```
java -jar GenBank2RDF-0.0.1-jar-with-dependencies.jar
```

This will provide you an overview with the commands that can be used for the annotation:

```
 -c,--codon <4/11>               Codon table used
 -f,--format <gbk/embl>          EMBL/Genbank format used
 -i,--input <file>               Fasta file input
 -id,--identifier <identifier>   Genome identification tag if required
 -o,--output <file>              Output filename
 -s,--source <NCBI/RAST/SAPP>    Source of genbank (NCBI/RAST/SAPP)
```

The following command then allows you to convert the genome file to a RDF database that can be used for further annotation.

```
java -jar GenBank2RDF-0.0.1-jar-with-dependencies.jar --input GCA_000019445 --output GCA_000019445.hdt --codon 11 --format embl --identifier GCA_000019445 --source ENA 

Parsing as EMBL
NTRIPLES: /var/folders/vp/w1zw990x6bn8v_w8km1r78mc0000gn/T/tmp2613306144392291389.nt
File converted in: 1 sec 572 ms 269 us
HDTSAVE: GCA_000019445.hdt
```

The GCA_000019445.hdt file can then be used for gene prediction and is then complemented with protein domain annotation.

#### Gene prediction

To identify the commands used for gene prediction just run the application without any extra arguments.

```
java -jar genecaller-0.0.1-jar-with-dependencies.jar 
org.apache.commons.cli.MissingOptionException: Missing required options: i, o, c, r
usage: Missing arguments, possible options see below
 -c,--codon <integer>   Codon table
 -i,--input <file>      Fasta file input
 -o,--output <file>     Output filename
 -r,--runtype <name>    Run type options (single/meta/naive/augustus)
 -t,--transcriptome     Use transcriptome for gene prediction? Only useful
                        for augustus...
```

The following command then allows you to perform the gene prediction using the specific codon table and corresponding input / output files.

```
java -jar genecaller-0.0.1-jar-with-dependencies.jar --input GCA_000019445.hdt --output GCA_000019445_gene.hdt --runtype single --codon 11

Could not read .hdt.index, Generating a new one.
Predicate Bitmap in 28 ms 583 us
Count predicates in 69 ms 323 us
Count Objects in 22 ms 7 us Max was: 24891
Bitmap in 2 ms 922 us
Object references in 33 ms 971 us
Sort object sublists in 43 ms 599 us
Count predicates in 7 ms 151 us
Index generated in 110 ms 408 us
time: 302 for query queries/getGenome.txt
binaries/mac/prodigal/2.6.3/prodigal
./GeneCaller/temp/prodigal
Creating file: ./GeneCaller/temp/prodigal
./GeneCaller/temp/prodigal -q -f gff  -o GCA_000019445.hdt_genecaller.gff -a GCA_000019445.hdt_proteins.fasta -p single -g 11 -t GCA_000019445.hdt_genecaller.trn -d GCA_000019445.hdt_nucleotide.fasta -i GCA_000019445.hdt.fasta
./GeneCaller/temp/prodigal -q -f gff -o GCA_000019445.hdt_genecaller.gff -a GCA_000019445.hdt_proteins.fasta -p single -g 11 -t GCA_000019445.hdt_genecaller.trn -d GCA_000019445.hdt_nucleotide.fasta -i GCA_000019445.hdt.fasta
NTRIPLES: /var/folders/vp/w1zw990x6bn8v_w8km1r78mc0000gn/T/tmp8756692358011294498.nt
HDT2RDF: /var/folders/vp/w1zw990x6bn8v_w8km1r78mc0000gn/T/tmp8756692358011294498.nt
File converted in: 2 sec 301 ms 810 us
HDTSAVE: GCA_000019445_gene.hdt
```

This will then generate the output file GCA_000019445_gene.hdt which holds the original annotation and the newly added gene prediction information.

#### Protein domain annotation using PFAM

The InterProScan module can then be used to annotate the original and newly identified genes with protein domains.

Execution is then as follow:

```
java -jar interproscanRDF-0.0.1-jar-with-dependencies.jar  
org.apache.commons.cli.MissingOptionException: Missing required options: i, o, v, f
usage: Missing arguments, possible options see below
 -a,--applications <p>              Applications (TIGRFAM,...)
 -dp,--disableprecalc               Disable precalculation lookup
 -f,--format <TURTLE>               RDF format (TURTLE)
 -i,--input <file>                  Fasta file input
 -java <path to java if required>   If the default java is not 1.8 a path
                                    can be given to 1.8
 -o,--output <file>                 Output filename
 -v,--version <name>                Version of interproscan
                                    <interproscan-5.13-52.0>
```

This then results in the following command that is to be used for PFAM annotation. 

```
java -jar interproscanRDF-0.0.1-jar-with-dependencies.jar --applications PFAM --disableprecalc --input GCA_000019445_gene.hdt --output GCA_000019445_gene_interproscan.hdt --version interproscan-5.19-58.0...
...

```


#### Retrieval of the gene prediction variation

To identify the impact of re-annotation the following query can be used

```
PREFIX ssb:<http://csb.wur.nl/genome/>
PREFIX biopax:<http://www.biopax.org/release/bp-level3.owl#>
SELECT (COUNT(DISTINCT(?feature)) AS ?old) (COUNT(DISTINCT(?feature2)) AS ?new)
WHERE {
?genome a ssb:Genome .
  ?genome ssb:dnaobject ?dna .
  
  { 
    ?dna ssb:feature ?feature .
    ?feature a ssb:Gene .
	?feature ssb:source "ENA" .
  } UNION {
    ?dna ssb:feature ?feature2 .
    ?feature2 a ssb:Gene .
    ?feature2 ssb:tool 'prodigal' .
  }
} group by ?genome
```

The results should look as follows:

```
old		new
5309	5237
```

#### Retrieval of protein domain positioning
To retrieve the protein domain architecture the following query can be exectuted:

```
PREFIX ssb:<http://csb.wur.nl/genome/>
PREFIX biopax:<http://www.biopax.org/release/bp-level3.owl#>
SELECT ?protein ?begin ?end ?id
WHERE {
?genome a ssb:Genome .
  ?genome ssb:dnaobject ?dna .
  ?dna ssb:feature ?feature .
  ?feature a ssb:Gene .
  ?feature ssb:tool 'prodigal' .
  ?feature ssb:protein ?protein .
  ?protein ssb:feature ?domain .
  ?domain ssb:begin ?begin .
  ?domain ssb:end ?end .
  ?domain ssb:signature ?signature .
  ?signature biopax:xref ?xref .
  ?xref biopax:db 'pfam' .
  ?xref biopax:id ?id .
} ORDER BY ?protein 
LIMIT 10
```

The results should look as follows:

```
protein	begin	end	id
<http://csb.wur.nl/genome/protein/0001ddf3c7eee954cc481996921953239fb16ee7e2e3814f7ec28b8e50519c096b0dfa2875ac7b94443fd3ba184e6ca2>	99	248	PF13614
<http://csb.wur.nl/genome/protein/0005673dc74fe4b897e6c7cccba038f08208140390fda3840881992875abd0d1a482843babf08e8eeea0aaa98e919e97>	35	400	PF00282
<http://csb.wur.nl/genome/protein/000f110bec8d8a72966691a835165f00343fbad5d571b929cda2fcc013be018e1c814ff9832001a6614968e9ca093361>	3	113	PF00072
<http://csb.wur.nl/genome/protein/000f110bec8d8a72966691a835165f00343fbad5d571b929cda2fcc013be018e1c814ff9832001a6614968e9ca093361>	146	221	PF00486
<http://csb.wur.nl/genome/protein/000ff46897e1dc61b60b5f2d8986daa364ec8438ec5d9c54723109c567f1a4f5b54e48cddcec0fdfa42463d0172d3dbb>	3	95	PF00163
<http://csb.wur.nl/genome/protein/000ff46897e1dc61b60b5f2d8986daa364ec8438ec5d9c54723109c567f1a4f5b54e48cddcec0fdfa42463d0172d3dbb>	97	143	PF01479
<http://csb.wur.nl/genome/protein/0015156ca8be0f3d7c0115fc414bc7abf5a807d53e75791936baa4a129df63272ca7aad4c470c5a609b110e8056399f4>	3	187	PF00106
<http://csb.wur.nl/genome/protein/0028e4cd024faffd01edbcbd52f6ddf480cc221f0e5d74d8a4697616d031f40d764a79fdff0624656b645b38142e3d7f>	69	144	PF08479
<http://csb.wur.nl/genome/protein/0030dda76e1268aea6e0bd9f698cbffc253c4c7eeae7b3d1cc951f8718e20aad143b0c2ce4f6de5a0f69a6b20d7163d4>	86	135	PF11776
<http://csb.wur.nl/genome/protein/0039c329dbc06ac02601f30384d540c07fec471fcd53c6c709df6fec3d9e7d02d0c0a0f87b0b56e9d1a3dc09d058e8df>	4	72	PF13411
```
