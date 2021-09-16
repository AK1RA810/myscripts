#!/usr/bin/python
#coding:utf-8
import socket,sys

if len(sys.argv) !=3:
	print('Modo de usar: python smtpenum.py 192.168.0.1 user')
	sys.exit(0)
else:
	tcp = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
	tcp.connect((sys.argv[1],25))
	banner = tcp.recv(1024)
	print(banner)

	tcp.send('VRFY '+sys.argv[2]+'\r\n')
	user = tcp.recv(1024)
	print(user)
	tcp.close()
