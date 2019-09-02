require 'cgi'
cgi = CGI.new

puts cgi.header
puts "<html><body>This is a test cgi implementation</body></html>"
