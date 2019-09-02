#To-do: conditional variables for prevention of deadlock

def func1

c = 0

while c<=10
puts "This is func1: " + c.to_s

c = c + 1
if c==3

raise "Error"

return

end
end

end


def func2

c=0
while c<=10
puts "This is func2: " + c.to_s
c = c+1
end

end


puts "This is main start"

t1 = Thread.new{func1()}
t2 = Thread.new{func2()}
t1.abort_on_exception = true
sleep(1)
puts "main end"
