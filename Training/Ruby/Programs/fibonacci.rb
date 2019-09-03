def print_fib(n)
	if n==1
		return 0
	end
	if n==2
		return 1
	end
	return  fib(n-1) + fib(n-2)
end


puts "Enter index (1 based):"
num = gets.chomp.to_i
puts print_fib(num).to_s
