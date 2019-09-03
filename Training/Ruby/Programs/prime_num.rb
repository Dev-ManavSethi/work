puts "Enter number:"
n = gets.chomp.to_i
is_prime = true
if n.eql? 1
	puts "1 is neither prime nor composite"
	is_prime =false
else
 for i in 2..(n-1)/2 do
   if (n%i).eql? 0
    is_prime = false
    end
  end
  if is_prime
   puts "#{n} is a  prime number"
   else
   puts "#{n} is not a  prime number"
 end
end
