puts "Enter word: (! to end)"


while (word = gets.chomp) 

	if word.eql?'!'
		break
	end

puts "Palindrome?: " + (word==word.reverse).to_s


end
