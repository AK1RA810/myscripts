#!/bin/bash

if [ "$1" == "" ]
then
	echo "Modo de uso: $0 site.com"
else
	for sub in $(cat common.txt);
	do
		host -t cname $sub.$1 2>/dev/null | grep "alias" | grep -v google;
	done
fi
