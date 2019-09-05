def factorial(num)

if (num==0 || num==1)

return 1

end

return num*factorial(num-1)

end


puts "Enter number: "
num = gets.chomp.to_i

puts factorial(num).to_s
