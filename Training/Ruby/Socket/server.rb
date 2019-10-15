require 'socket'

port = 5000
puts 'Listening on port: ' +port.to_s


serv = TCPServer.open(port)



if (serv==nil) 
serv.close
return
end

closeServer = false

while !closeServer

client = serv.accept

client.puts('Hello client!')

client.close
end
