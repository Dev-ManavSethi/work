require 'rexml/document'
include REXML

xmlfile = File.new("movies.xml")
xmldoc = Document.new(xmlfile)

=begin
#Now get the root element
root = xmldoc.root
puts "Root element: " + root.attributes["shelf"]

# This will output all the movie titles.
xmldoc.elements.each("collection/movie"){ 
   |movie| puts "Movie Title : " + movie.attributes["title"] 
}

# This will output all the movie types.
xmldoc.elements.each("collection/movie/type") {
   |movie| puts "Movie Type : " + movie.text 
}

# This will output all the movie description.
xmldoc.elements.each("collection/movie/description") {
   |movie| puts "Movie Description : " + movie.text 
}


=end

puts xmldoc.root.methods
