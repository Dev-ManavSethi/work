def Print( matrix )

    for array in matrix
        array.select{|x| print x.to_s.rjust(4," ")}
        puts
    end
end

def multiply( m1, m2 )

    result = Array.new( m1.length ) { Array.new( m2[0].length ) {0} }

    for i in 0..result.length - 1
        for j in 0..result[0].length - 1
            for k in 0..m1[0].length - 1
                result[i][j] += m1[i][k] * m2[k][j]
            end
        end
    end

    return result
end

puts "Matrix-1".center 50,"-"
puts "Enter a0:"
a0 = gets.chomp.to_i
puts "Enter a1:"
a1 = gets.chomp.to_i
puts "Enter b0:"
b0 = gets.chomp.to_i
puts "Enter b1:"
b1 = gets.chomp.to_i
puts "Enter c0:"
c0 = gets.chomp.to_i
puts "Enter c1:"
c1 = gets.chomp.to_i

puts "Matrix-2".center 50,"-"
puts "Enter d0:"
d0 = gets.chomp.to_i
puts "Enter d1:"
d1 = gets.chomp.to_i
puts "Enter e0:"
e0 = gets.chomp.to_i
puts "Enter e1:"
e1 = gets.chomp.to_i
puts "Enter f0:"
f0 = gets.chomp.to_i
puts "Enter f1:"
f1 = gets.chomp.to_i

matrixA = [
    [a0, b0, c0],
    [a1, b1, c1]
]

matrixB = [
    [d0, d1],
    [e0, e1],
    [f0, f1]
]

puts "Matrix A: "
Print( matrixA )

puts 

puts "Matrix B:"
Print( matrixB )

puts 

puts "Matrix A * Matrix B"
resMatrix = multiply( matrixA, matrixB )
Print( resMatrix )
