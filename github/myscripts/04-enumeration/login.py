#!/usr/bin/python
import socket

print "Interagindo com FTP"
alvo = raw_input("Digite o IP:")
porta = 21

mysock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
mysock.connect((alvo,porta))
banner = mysock.recv(1024)
print banner

print "Enviando Login"
mysock.send("USER ftp\r\n")
banner = mysock.recv(1024)
print banner

print "Enviando Senha"
mysock.send("PASS ftp\r\n")
banner = mysock.recv(1024)
print banner
