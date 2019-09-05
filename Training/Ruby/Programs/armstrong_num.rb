puts "Enter a number to check"
number=STDIN.gets.to_i
sum=0
d=number
while d!=0
   sum+=(d%10)**3
   d=d/10
end
if(sum.eql?number)
   puts "Armstrong number"
else
   puts "Not Armstrong"
end
