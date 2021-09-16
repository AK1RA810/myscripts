#!/bin/bash
if [ "$2" == "" ]
then
	echo "|||||Metadata Analyze|||||"
	echo "Modo de uso: $0 site.com pdf"
else
	echo "|||||||||||||||||||||||||||||||||||||||||||||Analisando...||||||||||||||||||||||||||||||||||||||||||||"
	links=$(lynx https://www.google.com/search?q=site:$1+ext:$2 --dump | grep https | cut -d "=" -f2 | egrep -v "site|google" | egrep "http|https" | sed 's/...$//')
	if [ "$links" == "" ]
	then
		echo "||||||||||||||||||||||||||||||||||||||||||||Sem Resultados||||||||||||||||||||||||||||||||||||||||||||"
	else
		echo "|||||||||||||||||||||||||||||||||||||||||Resultados Encontrados|||||||||||||||||||||||||||||||||||||||"
		mkdir results
		for i in $links;
		do
			echo "------------------------------------------------------------------------------------------------------"
			echo "                           >>>$i<<<"
			echo "------------------------------------------------------------------------------------------------------"
			wget -q $i -P results
			lista=$(ls results/)
			echo "                                                | $lista |"
			echo "------------------------------------------------------------------------------------------------------"
			exiftool results/$lista
			echo "------------------------------------------------------------------------------------------------------"
			rm results/"$lista"
		done
		rm -Rf results
	fi
fi
