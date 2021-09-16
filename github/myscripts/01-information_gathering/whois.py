#!/usr/share/python
import socket, sys

mysock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
mysock.connect(("whois.iana.org",43))
mysock.send(sys.argv[1]+"\r\n")
resp = mysock.recv(1024).split()
whois = resp[19]
mysock.close()

mysock2 = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
mysock2.connect((whois,43))
mysock2.send(sys.argv[1]+"\r\n")
resp2 = mysock2.recv(1024)
print(resp2)
