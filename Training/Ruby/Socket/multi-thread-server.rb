require 'socket'


port = 5000
serv = TCPServer.open(port)


while true

client = serv.accept
Thread.start(client) do

puts 'NEW CLIENT!'
client.puts('Hi, client!:')

client.close

end


end
