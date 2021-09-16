#!/bin/bash
#HTMLParsing(v1.4) - AK1RA810
if [ "$1" == "" ]
then
	echo -e "\033[0;35m============================================================================\033[0m"
	echo -e "\033[0;36m                          HTMLPARSING v1.4 - AK1RA810\033[0m"
	echo -e "\033[0;36m                          MODO DE USAR: $0 site.com.br\033[0m"
	echo -e "\033[0;35m============================================================================\033[0m"
        else
	vari=$(host $1 | cut -d '(' -f2 | sed 's/.$//' | cut -d " " -f1 | sed 's/\.//' | sed 's/\.//' | sort -u)
	if [ "$vari" == 'NXDOMAIN' ]
		then
			echo -e "\033[0;35m============================================================================\033[0m"
			echo -e "\033[0;36m                               ENDEREÇO INVÁLIDO!\033[0m"
			echo -e "\033[0;35m============================================================================\033[0m"
		else
			echo -e "\033[0;35m============================================================================\033[0m"
			echo -e "\033[0;36m                              REALIZANDO ANÁLISE\033[0m"
			echo -e "\033[0;35m============================================================================\033[0m"
			wget $1 2> arq
			teste=$(cat arq | grep "ERRO" | cut -d' ' -f3)
			if [ "$teste" == "ERRO" ]
			then
				errado=$(cat arq | grep "ERRO" | awk -F' ' '{print $3" "$4"<=====>:"$5}' | sed s'/.$//'g)
				echo -e "              \033[0;35m>!!!!!!!!!!$errado!!!!!!!!!!<\033[0m"
			else
				var1=$(egrep 'salvo|saved' arq | cut -d ' ' -f6 | sed 's/“//' | sed 's/.$//' | sed 's/‘//')
				grep 'href' $var1 | cut -d '/' -f3 | cut -d '"' -f1 | grep '\.' | grep -v '<' > lista
				touch results;
				for url in $(cat lista);
				do
					host $url | grep "has address" | cut -d " " -f1,4 | sed 's/ / <----> /' >> results;
				done
				echo -e "\033[0;31m============================================================================\033[0m"
        			echo -e "\033[0;32m                            RESULTADOS HTMLPARSING\033[0m"
        			echo -e "\033[0;31m============================================================================\033[0m"
				cat results | sort -u
				mkdir tmp
				mv lista tmp/list
				mv results tmp/result
				mv arq tmp/list2
				mv index.html tmp/index.html
				rm -Rf tmp
			fi
			echo -e "\033[1;36mDeseja realizar outra análise? (Y/n)\033[0m"
			read ana
			case $ana in
			"y")
				echo -e "\033[1;31mAlvo:\033[0m"
				read alvo
				$0 $alvo
			;;
			"")
				echo -e "\033[1;31mAlvo:\033[0m"
                                read alvo
                                $0 $alvo
			;;
			"n")
				echo -e "\033[0;35m============================================================================\033[0m"
				echo -e "\033[0;36m                          GOOD BYE AND KEEP LEARNING!\033[0m"
				echo -e "\033[0;36m                        HTMLPARSING v1.4 - BY AK1RA810\033[0m"
				echo -e "\033[0;35m============================================================================\033[0m"
			;;
			esac
	fi
fi
