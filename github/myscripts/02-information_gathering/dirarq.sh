#!/bin/bash
if [ "$2" == "" ]
then
	echo 'Modo de usar: $0 site.com.br php'
else
	echo "Deseja realizar bruteforce de diretorios?(y/n)"
	read respon
	if [ "$respon" == "n" ]
	then
		echo "Keep Learning!"
	else
		for dir in $(cat common.txt);
		do
			rsp=$(curl -s -H "User-Agent: Mozilla/84.0" -o /dev/null -w "%{http_code}" $1/$dir);
			if [ "$rsp" == "200" ] || [ "$rsp" == "403" ] || [ "$rsp" == "401" ]
			then
				echo "Diretório encontrado: [$rsp] http://$1/$dir"
			fi
		done
	fi
	echo "Deseja realizar bruteforce de arquivos?(y/n)"
	read respo
	if [ "$respo" == "n" ]
	then
		echo "Keep Learning!"
	else
		for arq in $(cat common.txt);
		do
			resp=$(curl -s -H "User-Agent: Mozilla/24.0" -o /dev/null -w "%{http_code}" $1/$arq.$2)
			if [ "$resp" == "200" ] || [ "$resp" == "403" ] || [ "$resp" == "401" ]
			then
				echo "Arquivo encontrado: [$resp] http://$1/$arq.$2"
			fi
		done
	fi
fi
