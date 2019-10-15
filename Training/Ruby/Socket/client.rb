require 'socket'

hname = 'www.tutorialspoint.com'
port = 80
path = "/index.htm"
sock = TCPSocket.open(hname, port)

req = "GET #{path} HTTP/1.0\r\n\r\n"

sock.print(req) #send req
resp = sock.read

headers, body = resp.split("\r\n\r\n", 2)
print body

