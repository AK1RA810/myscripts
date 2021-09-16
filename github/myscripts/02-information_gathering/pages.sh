#!/bin/bash

if [ "$2" == "" ]
then
	echo "Modo de usar: $0 site.com php"
else
	lynx -dump "https://google.com/search?num=100&q=site:"$1"+ext:"$2 | cut -d "=" -f 2 | grep "://" | grep ".$2" | egrep -v "site|google" | sed s'/...$//'g
fi
