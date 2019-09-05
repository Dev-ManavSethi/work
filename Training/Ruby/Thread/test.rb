require 'thread'

m = Mutex.new

count1 = count2 = 0
difference = 0
counter = Thread.new do
   loop do
m.synchronize do
      count1 += 1
      count2 += 1
end
   end
end
spy = Thread.new do
   loop do
m.synchronize do

      difference += (count1 - count2).abs
end
   end
end
sleep 1

printt = Thread.new do

loop do
puts difference
end

end


printt.join
