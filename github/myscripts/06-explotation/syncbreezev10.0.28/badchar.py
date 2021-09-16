#!/usr/bin/python2
for i in range(0,256):
	rst = hex(i).replace('0x','\\x')
	print rst,
