#!/bin/bash
if [ "$2" == "" ]
then
	echo "Modo de uso: $0 <arquivo> <hash>"
else
	VRFY=$(sha256sum $1 | cut -d ' ' -f 1)
	if [ $VRFY == $2 ]
	then
		echo "Arquivo Íntegro - [CONFIÁVEL]"
	else
		echo "Arquivo Modificado - [NÃO CONFIÁVEL]"
	fi
fi
