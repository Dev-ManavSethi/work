require_relative 'class'

class BigBox < Box

 def printArea
	@area = @height*@width
	puts "Big box area is: #{@area}"
	end
end

bigbox = BigBox.new(10,20)
bigbox.printArea
