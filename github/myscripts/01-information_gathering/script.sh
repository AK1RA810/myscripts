#!/bin/bash
if [ "$2" == "" ]
then
	echo "DNS Reverse"
	echo "Modo de usar: $0 192.168.0.1 192.168.0.10"
else
	ultoc=$(echo $2 | cut -d '.' -f 4)
	ultoctwo=$(echo $1 | cut -d '.' -f 4)
	ip=$(echo $1 | awk -F '.' '{print $1"."$2"."$3}')
	for loop in $(seq $ultoctwo $ultoc)
	do
		host -t ptr $ip.$loop
	done
fi
