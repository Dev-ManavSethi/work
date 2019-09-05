puts "Enter number: "

num = gets.chomp.to_i

temp = num

sum,r=0,0
while num>0

	r=num%10
	sum=(sum*10)+r    
	num=num/10
end

puts (temp==sum)
