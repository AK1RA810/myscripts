#!/bin/bash

if [ '$1' == '' ]
then
	echo "Zone Transfer Script - By AK1RA810"
	echo "Modo de uso: $0 site.com.br"
else
	for server in $(host -t ns $1 | cut -d " " -f 4 | sed s'/.$//'g);
	do
		host -l -a $1 $server;
	done
fi
