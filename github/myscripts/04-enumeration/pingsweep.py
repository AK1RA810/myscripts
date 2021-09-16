from scapy.all import *
conf.verb = 0
for ip in range(1,255):
	destino = "192.168.0.%s" %ip
	pIP = IP(dst=destino)
	pacote = pIP/ICMP()
	resp, noresp = sr(pacote,timeout=0.5)
	for resposta in resp:
		print(resposta[1][IP].src)
