#!/usr/bin/python
#coding: utf-8
import socket, sys

if (len(sys.argv) < 2):
	print ("Modo de uso: python ftpin.py 192.168.0.1")
else:
	sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
	sock.connect((sys.argv[1],21))
	banner = sock.recv(1024)
	print (banner)

	print("Enviando Usuário...")
	sock.send("USER ftp\r\n")
	username = sock.recv(1024)
	print (username)

	print ("Enviando Senha...")
	sock.send("PASS ftp\r\n")
	senha = sock.recv(1024)
	print (senha)

	print ("Enviando comando PWD...")
	sock.send("PWD\r\n")
	comando = sock.recv(1024)
	print (comando)

	sock.close()
