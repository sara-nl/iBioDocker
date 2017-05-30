REQUIREMENTS
------------

SAPP is depending on various modules which will be installed when you follow the installation procedure via install.sh

The core of SAPP is based on JAVA 1.8 using MAVEN dependencies. To know more about maven have a look at [https://maven.apache.org](https://maven.apache.org).

All modules have been tested on Ubuntu 16.04 using either Docker or a standalone ubuntu server.

Databases as well as certain software packeges ( e.g. interproscan) are downloaded upon installation of this module. When performing a reinstallation, folders are checked for existence and downloads are skipped accordingly. When during instalation a download becomes corrupted the corresponding folders or files are required to be removed manually.

The current installation used in-house is approxiamtely 160 gigabyte and can increase as for example the HMM module differs in size according to the running settings used.
