def fib(n)
        if n==1
                return 0
        end
        if n==2
                return 1
        end
        return  fib(n-1) + fib(n-2)
end


puts "Enter upto how many index fib series wanted?"

n = gets.chomp.to_i

i=1

while i<=n

	print fib(i)
	print " "

	i = i+1

end

puts " "
