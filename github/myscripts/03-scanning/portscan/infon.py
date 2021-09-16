#!/usr/bin/python3

def portas():
	top10portas = [21,22,23,25,53,80,110,111,445,443]
	top20portas = [21,22,23,25,53,80,110,111,445,443,139,137,143,993,8080,8008,8443,3306,22222,2049]
	top30portas = [21,22,23,25,53,80,110,111,445,443,139,137,143,993,8080,8008,8443,3306,22222,2049,2000,24,26,27,28,29,30,31,32,33]
	print("Lista de portas:\n")
	print("1)Top 10 portas\n")
	print("2)Top 20 portas")
	print("\n3)Top 30 portas\n")
	escolha = input(">>>>>")
	lista_escolhida = []
	if (escolha == "1"):
		lista_escolhida = top10portas
		return lista_escolhida
	elif (escolha == "2"):
		lista_escolhida = top20portas
		return lista_escolhida
	else:
		lista_escolhida = top30portas
		return lista_escolhida
