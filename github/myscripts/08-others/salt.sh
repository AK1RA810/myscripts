#!/bin/bash
if [ "$1" == "" ]
then
	echo "Modo de usar: $0 <hash_completa> wordlist.txt"
else
	id=$(echo -n "$1" | cut -d '$' -f2)
	salt=$(echo -n "$1" | cut -d '$' -f3)
	for ler in $(cat $2);
	do
		vrfy=$(openssl passwd -$id -salt $salt "$ler";)
		if [ $vrfy == $1 ]
		then
			echo "Hash Quebrado: $1 == $ler"
		fi
	done
fi
