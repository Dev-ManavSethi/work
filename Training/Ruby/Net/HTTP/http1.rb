require 'net/http'

host = 'www.tutorialspoint.com'
path = '/index.htm'

http = Net::HTTP.new(host)


headers, body = http.get(path)

if headers.code == "404"

puts "------------------BODY--------------------"
print body
else
puts "Error code: #{headers.code}--------Error message: #{headers.message}"

end
