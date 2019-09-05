
while true

puts "Enter number 1:"
num1s = gets.chomp

if num1s.eql?"!"
	break
end

num1 = num1s.to_i
puts "Enter command: + , -, * , /"
command = gets.chomp
puts "Enter number 2: "
num2=gets.chomp.to_i

case command

	when "+"
		puts num1+num2
	when "-"
		puts num1-num2
	when "*"
		puts num1*num2
	when "/"
		puts num1/num2
	else
		puts "invalid option: Please try again"
end

end
 

