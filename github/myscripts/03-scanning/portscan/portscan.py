#!/usr/bin/python3
import socket
from datetime import datetime
from infon import portas

ip = input("Alvo: ")
result = input("A) Select Ports \r\nB) All Ports\r\n====>")
if (result == "A" or result == "a"):
	lista = portas()
	def portscan(alvo):
		print("\r\nRealizando Scan...\r\n")
		inicio = datetime.now()
		for port in lista:
			sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
			socket.setdefaulttimeout(0.5)
			if(sock.connect_ex((alvo,port)) == 0):
				print("\n[+] Porta TCP Aberta: ",port)
				sock.close()
		final = datetime.now()
		tempo_total = (final - inicio)
		print("\nO tempo de duração do scan foi de: ",tempo_total,"\n")
	portscan(ip)
elif (result == "B" or result == "b"):
	print("\r\nRealizando Scan...\r\n")
	for all in range(1,65535):
		mysock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
		socket.setdefaulttimeout(0.5)
		if (mysock.connect_ex((ip,all)) == 0):
			print("\r\n[+] Porta TCP Aberta ",all)
			mysock.close()
else:
	print("Opção inválida...")
