INSTALLATION
------------

 * Most of the SAPP modules can be installed individually using MAVEN or through the provided ./install.sh file inside each module.
 
 * The SAPP main module contains a galaxy config file allowing you to use the modules inside a clean Galaxy instance as configuration files are currently overwritten.
 
 * To install the complete package: clone this module inside the tools directory of Galaxy.


`git clone https://gitlab.com/sapp/sapp.git`


 Note: When using this installation script, a postgresql database is created for Galaxy and extra dependencies are installed which requires root privilages.
 
 To start the installation procedure: ./install.sh

    cd sapp
    sudo ./install.sh
  
 
SUBMODULE INSTALLATION
------------
We have developed the SAPP framework in such a way that each module can be installed and run independently of the other developed modules. This allows you to specify which modules are required and to run jobs in parallel. The installation of each module follows the following procedures.

Firstly, the correct gitlab repository needs to be cloned using the `git clone "URL"` command. When cloning is completed an `install.sh` script can be found in the directory which automatically installs the required dependencies and compiles the Java code into an executable. When the installation is successful the jar package can be executed through `java -jar` and a help section with a list of possible commands are shown.

For example, to convert embl or genbank files to the RDF datamodel a conversion module is required.

The correct link to the repository can be found in the submodule on the left and can then be cloned as followed:

`git clone https://gitlab.com/sapp/genbank2rdf`
```
Cloning into 'genbank2rdf'...
remote: Counting objects: 330, done.
remote: Compressing objects: 100% (122/122), done.
remote: Total 330 (delta 100), reused 243 (delta 70)
Receiving objects: 100% (330/330), 27.57 MiB | 2.76 MiB/s, done.
Resolving deltas: 100% (100/100), done.
Checking connectivity... done.
```

To compile the program we move into the directory and run the installation script

`cd genbank2rdf`
`./install.sh`

This will run a series of tests to validate the code and compile the program

```
Already up-to-date.

-------------------------------------------------------
 T E S T S
-------------------------------------------------------
Running nl.wur.ssb.GenBank2RDF.AppTest
AAGK01000009.gz
/Users/sapp/.m2/repository/com/github/sapp/RDFSimpleCon/991e0ab/temp/AAGK01000009.gz
Creating file: /Users/sapp/.m2/repository/com/github/sapp/RDFSimpleCon/991e0ab/temp/AAGK01000009.gz
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/Users/sapp/.m2/repository/org/slf4j/slf4j-log4j12/1.7.12/slf4j-log4j12-1.7.12.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/Users/sapp/.m2/repository/org/apache/logging/log4j/log4j-slf4j-impl/2.2/log4j-slf4j-impl-2.2.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
Parsing as EMBL GZip
Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 3.15 sec

Results :

Tests run: 1, Failures: 0, Errors: 0, Skipped: 0

Adding org.apache.maven.scm.provider.ScmProvidersvn
Component: org.apache.maven.scm.provider.ScmProvidersvn is already defined. Skipping.
```

Once the installation is completed the following jar file should appear in the directory.

`GenBank2RDF-0.0.1-jar-with-dependencies.jar`

Which can then be executed using:

`java -jar GenBank2RDF-0.0.1-jar-with-dependencies.jar ` 

returning the options that can be given to the application

```
org.apache.commons.cli.MissingOptionException: Missing required options: i, o, format, codon, s
usage: Missing arguments, possible options see below
 -codon <4/11>                  Codon table used
 -format <gbk/embl>             EMBL/Genbank format used
 -i,--input <file>              Fasta file input
 -id <identifier>               Genome identification tag if required
 -o,--output <file>             Output filename
 -s,--source <NCBI/RAST/SAPP>   Source of genbank (NCBI/RAST/SAPP)
```