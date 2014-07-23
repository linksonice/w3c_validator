#!/bin/bash

cpanm URI
# aka cpanm http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/URI-1.60.tar.gz
cpanm JSON
# aka cpanm -vn http://search.cpan.org/CPAN/authors/id/M/MA/MAKAMAKA/JSON-2.90.tar.gz 

# this 3rd part pulls in the latest markup validator tarball (v1.3 assumed) and puts everything in the right place "just so"

if [[ ! -f /opt/front-end-is-good ]]; then
   validatorpath="/usr/local/validator"
   cd /tmp/ && wget http://validator.w3.org/validator.tar.gz && \
   wget http://validator.w3.org/sgml-lib.tar.gz && \ 
   tar zxvf validator.tar.gz && \ 
   tar zxvf sgml-lib.tar.gz && \ 
   mkdir $validatorpath && cd validator-1.3 && \
   mv htdocs share httpd/cgi-bin $validatorpath && \
   mv /tmp/validator-1.1/htdocs/sgml-lib $validatorpath/htdocs/ # this is for the sgml-lib, also crucial but badly documented by w3c 
   mkdir /etc/w3c && cp $validatorpath/htdocs/config/* /etc/w3c/
   touch /opt/front-end-is-good
fi
