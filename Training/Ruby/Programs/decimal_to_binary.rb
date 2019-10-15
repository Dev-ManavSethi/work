def dec_to_bin(n)
  if n < 2 
    return n.to_s 
  else 
    dec_to_bin(n/2) + dec_to_bin(n%2)
  end 
end 

puts "Enter number: "
n=gets.chomp.to_i
puts dec_to_bin(n).to_s
