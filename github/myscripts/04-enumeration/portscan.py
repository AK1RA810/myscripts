import sys
from scapy.all import *

if (len(sys.argv) < 2):
	print("Modo de uso: python portscan.py 192.168.0.1")
else:
	conf.verb = 0
	portas = [80,443,3306,8080,110,143,139,21]
	pIP = IP(dst=sys.argv[1])
	pTCP = TCP(dport=portas,flags="S")
	pacote = pIP/pTCP
	resp, noresp = sr(pacote)
	for resposta in resp:
		flag = resposta[1][TCP].flags
		porta = resposta[1][TCP].sport
		if (flag == "SA"):
			print("Porta",porta,"ABERTA")
