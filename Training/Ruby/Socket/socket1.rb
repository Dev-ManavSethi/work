require 'socket'

hname = 'www.google.com'
port=80
sock = TCPSocket.open(hname, port)

puts sock.methods
