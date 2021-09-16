#!/usr/bin/python
#coding:utf-8
import socket,sys,re

if len(sys.argv) !=2:
	print('Modo de uso: python smtpuser.py 192.168.0.1')
	sys.exit(0)
else:
	listing=open("lista.txt")
	smtp = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
	smtp.connect((sys.argv[1],25))
	banner = smtp.recv(1024)
	print(banner)
	for list in listing:
		smtp = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
		smtp.connect((sys.argv[1],25))
		banner = smtp.recv(1024)
		smtp.send('VRFY '+list)
		user = smtp.recv(1024)
		if re.search("252",user):
			print('Usuário Encontrado: '+user.strip("252 2.0.0"))
