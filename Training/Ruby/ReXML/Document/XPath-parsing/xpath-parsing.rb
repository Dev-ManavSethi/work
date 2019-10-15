require 'rexml/document'
include REXML

=begin
xmlfile = File.new("movies.xml")
xmldoc = Document.new(xmlfile)

# Info for the first movie found
movie = XPath.first(xmldoc, "//movie")
p ('First movie element: ' + movie.to_s)

# Print out all the movie types
puts 'Movie Types: '
XPath.each(xmldoc, "//type") { |e| puts e.text }

# Get an array of all of the movie formats.
puts 'Movie formats: '
names = XPath.match(xmldoc, "//format").map {|x| x.text }
p names
=end

puts XPath.methods
