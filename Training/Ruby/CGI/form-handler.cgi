require 'cgi'

cgiob = CGI.new
fname=cgiob['fname']
lname = cgiob['lname']
puts fname
puts lname

hash = cgiob.params
puts hash

keys = cgiob.keys

names = cgiob['name']

for name in names
print name + " "
end

