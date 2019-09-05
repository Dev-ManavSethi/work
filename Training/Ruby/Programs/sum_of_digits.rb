
puts "Enter num: "
n = gets.chomp.to_i

i = n

sum = 0

while i > 0

    r = i % 10

    sum += r

    i /= 10

end

puts "#{sum}"
