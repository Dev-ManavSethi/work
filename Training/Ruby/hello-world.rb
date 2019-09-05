

#Ruby is a OO lang
#Go isn't

#array
names = Array.new(4, "mac")
puts "#{names}"

puts names.size
puts names.length

nums = Array.new(10) { |e| e = e * 2 }
puts "#{nums}"

nums2 = Array.[](1, 2, 3, 4,5)
nums = Array[1,2,3,4,5]

#Array method in kernel module, takes only one arg
digits = Array(0..9)
puts "#{digits}"

#array methods:

arr.at(num)
arr.pack('') #to-do




#todo: . and :: operator

#continue : https://www.tutorialspoint.com/ruby/ruby_blocks.htm

=begin
operators precedence

Yes 	:: 	Constant resolution operator
Yes 	[ ] [ ]= 	Element reference, element set
Yes 	** 	Exponentiation (raise to the power)
Yes 	! ~ + - 	Not, complement, unary plus and minus (method names for the last two are +@ and -@)
Yes 	* / % 	Multiply, divide, and modulo
Yes 	+ - 	Addition and subtraction
Yes 	>> << 	Right and left bitwise shift
Yes 	& 	Bitwise 'AND'
Yes 	^ | 	Bitwise exclusive `OR' and regular `OR'
Yes 	<= < > >= 	Comparison operators
Yes 	<=> == === != =~ !~ 	Equality and pattern match operators (!= and !~ may not be defined as methods)
  	&& 	Logical 'AND'
  	|| 	Logical 'OR'
  	.. ... 	Range (inclusive and exclusive)
  	? : 	Ternary if-then-else
  	= %= { /= -= += |= &= >>= <<= *= &&= ||= **= 	Assignment
  	defined? 	Check if specified symbol defined
  	not 	Logical negation
  	or and 	Logical composition








=end


=begin

.. 	Creates a range from start point to end point inclusive. 	1..10 Creates a range from 1 to 10 inclusive
... 	Creates a range from start point to end point exclusive. 	1...10 Creates a range from 1 to 9.

foo = 42
defined? foo    # => "local-variable"
defined? $_     # => "global-variable"
defined? bar    # => nil (undefined)

defined? puts        # => "method"
defined? puts(bar)   # => nil (bar is not defined here)
defined? unpack      # => nil (not defined here)


defined? yield    # => "yield" (if there is a block passed)
defined? yield    # => nil (if there is no block)


=end

#backslash operator

#backslash notations
=begin
\n 	Newline (0x0a)
\r 	Carriage return (0x0d)
\f 	Formfeed (0x0c)
\b 	Backspace (0x08)
\a 	Bell (0x07)
\e 	Escape (0x1b)
\s 	Space (0x20)
\nnn 	Octal notation (n being 0-7)
\xnn 	Hexadecimal notation (n being 0-9, a-f, or A-F)
\cx, \C-x 	Control-x
\M-x 	Meta-x (c | 0x80)
\M-\C-x 	Meta-Control-x
\x 	Character x
=end

#Classes:
Fixnum
Bignum
Float

12.3
1.0e6
4E20
4e+20

? gives char code
?a 97
?\n 0x0a
0 octal
0x hex
0b binary
1_23 = 123

#Adv of ruby



    Ruby is an open-source and is freely available on the Web, but it is subject to a license.

    Ruby is a general-purpose, interpreted programming language.

    Ruby is a true object-oriented programming language.

    Ruby is a server-side scripting language similar to Python and PERL.

    Ruby can be used to write Common Gateway Interface (CGI) scripts.

    Ruby can be embedded into Hypertext Markup Language (HTML).

    Ruby has a clean and easy syntax that allows a new developer to learn very quickly and easily.

    Ruby has similar syntax to that of many programming languages such as C++ and Perl.

    Ruby is very much scalable and big programs written in Ruby are easily maintainable.

    Ruby can be used for developing Internet and intranet applications.

    Ruby can be installed in Windows and POSIX environments.

    Ruby support many GUI tools such as Tcl/Tk, GTK, and OpenGL.

    Ruby can easily be connected to DB2, MySQL, Oracle, and Sybase.

    Ruby has a rich set of built-in functions, which can be used directly into Ruby scripts.




#modules

module mod_name

#methods





end


require_relative "filepath relative"
include mod_name #in the the .rb file

mod_name.method(arg)
mod_name.attr




#inheritance

class Class1

#attr

#init

#methods



end


class Class2 < Class1

#polymorphsm allowed

end

#initialise method /constructor
#classes

class ClassName

	attr_accessor :att1, :att2, :att3
	def initialize(args...)

	@att1 = arg1
#access the att1 by @ operator
	#asa obj is creared, initialize is called

	end


	def class_method_1(args...)



	end
end


object = ClassName.new()

object.att1 = ""




#errors handling
begin

raise Type 'message' condition
#here error could happen
rescue TypeOfError

rescue TypeOfErr2 => var

#do anything with var

else 
#For other exceptions

ensure

#all will be executed

retry #restart from begin

end

#raised error messages can be captured using $!

#reading from external files

#mode = r, r+ (read, write at begining, no trunc), w (truncates to zero length), w+: read, write, trunc to zero length, a: write only, appends or create new file, a+ read, write, append, or creates new file if dne, b%: binary file mode, t% except b: text file mode

File.open(filename_with_relative_path, mode) do |file|
#or file = File.open(fname, mode)
# read: file.read() #returns string

#read line: file.readline() reads a line, returns string, puts cursor to the end of the line
#file.readline() reads the next line

#file.readlines returns []string

file.write(what_to_write)


file.close()

#comments

#comment

=begin

cc

cc
c
c

c



=end

#for loop

for toffee in toffees_array


end


toffees.each do |toffee|


if some_condition

retry

end

end

for index in start_num..end_num

retry if some_condition
end


num.times do |index|


end


2,3


#while

while condition # [do]


end


#until 
until condition # [do]

end


#case
var  = 1

case var

when 1, 4
puts var

when 2,5
puts var

when 3,6 #3 or 6
puts var

else
puts "Invalid"


end

#unless : works when condition=false

unless condition

else


end


puts "code" unless condition


#if 
puts "code" if condition


condition = true
cond2 = false

if condition and cond2 # [then]

puts condition
elsif condition


else



end

#next = continue

#redo: call the latest iteration without checking condition

#constants always start with uppercase
#methods: begin with lowercase only

def function_name(arg1, arg2, arg3 = "default_value")

puts "Hello from method!"
return arg1, arg2

end

def fname (*test)

for i in 0..test.length

end

end



function_name 1,2 #return array if no. of values more than 1


#hash

map = Hash.new

or

map = Hash.new("map")

or 

map = Hash.new "month"
#makes hash with default val of month for any key

arr = [1, "jan",true]

#any object can be used as key or value

map = {

"Manav" => "Software Dev",
"Age" => 24,
12 => "Twelve"
arr => "array"

}

puts
puts
puts

puts "#{map['Age']}"
puts map
puts map["Age"]

#hash methods

hash.keys #returns array of keys
hash1 == hash2 #checks if kv pairs are same , and having same no. of kv pairs
hash.[key] #same as hash[key]
hash.[key] = value #same as hash[key] = value
hash.clear #removes all kv pairs
hash.default #returns default value for hash
hash.defaul(key=nil) #return value if key exists, or nil if key dne
hash.default = obj
hash.default_proc #returnns the block of nil which created the hash
hash.delete(key)
hash.delete_if {|key,value|, block} #deletes for every pair block returns true
hash.each {|k,v| block} #iterates over hash, using kv in block as 2-D array
hash.each_key {|key| block}
hash.each_key {|key| block}
hash.empty?

hash.fecth(key, [default])
hash.fetch(key) {|key| block}

hash.has_value?(value)
hash.length
hash.invert
hash.inspect #pretty string version of hash
hash.merge(hash2) #duplicates are overridden from hash2
hash.reject {|k,v| block} #creates a new hash for every pair block evaluates to true
hash.size
hash.to_a
hash.to_s
hash.value?(v) #bool
hash.values
hash.values_at(objs...) #returns arr of keys


#time
time = Time.new
time2 = Time.now
time.wday
time.yday

t1 = Time.local(y, m, d, h, min) #local 12 hour
t2 = Time.utc(y,m,d,h,min) #24 hour
t2  = Time.gm(y,m,d,h,min,sec)

arr = t1.to_a #[s,min, h,d,m,y,wday,yday,isdt,zone]

Time.local(*arr)
Time.gm(*arr)


#ranges
zeroToNine = 0..9
zeroToeIGHT = 0...8

range.include?(num) bool
range.min
r.max
r.reject {|i| i< l} #return arr of accepted values
digits.each do |digit|

if (start..end===num)


end

end



#iterator

collection.each do |var|

#code


end


arr.collect #returns array

digits = Array(0..9)
puts "#{digits}"




string = "Hello"
print string
puts string
#prints \n too

#string methods
string.upcase()
string.downcase()
string.strip()
string.length()
string.include? "Hell"
string[0]
string[0,3] #inc 0, not 3
puts string.index("H")
puts string


num = 10
#number
puts num.to_s
num.abs()
num.round()
num.ceil()
num.floor()
Math.sqrt(num) #return float
Math.log(num)

puts 1.01 + 8


#to-do string methods, ints n floats, basic classes and their methods

#input
puts ("Enter input: ")
input = gets #takes input as string + Enter(\n)
puts ("Hello " + input + ", How are you?") 

inp2 = gets.chomp() #takes input w/o Enter
puts (inp2)
puts ("Enter a number: ")
num1 = gets.chomp()
puts(num1.to_i + num1.to_f)


#Arrays

ar = Array[1,"b",false]
puts ar

ar2 = Array.new

ar3 = [1, "A", true]
ar2[0] = 1
ar2[5] = 5

#array methods

ar.length()
ar.include? 1 #returns bool
ar.reverse()
ar.sort() #err on diff data types

#hash

map = {

"Manav" => "Software Dev",
"Age" => 24,
12 => "Twelve" 

}

puts map


#I/O
#module: Kernel


#Files

file = File.new(fname_with relative_path, mode)

#do sometime with file

file.close #or file.close()


file = File.open(fname_with_path, mode)
#process file

end

#file.open can be associated with a block , file.new cannot be

file.sysread(num_of_chars_to_read)
file.readline()
file.read()
file.syswrite('text_to_write')


#IO class: Parent class of File class

arr = IO.readlines(filename_with_relative_path)

IO.foreach(filename) {|block| puts block} #does not return array, passes line by line string to block
File.rename(oldname, newname)
File.delete(filename)

file = File.new(filename, mode)
file.chmod(int mode/ mask value)

File.open(fname) if File::exists?(fname)

#checks whether a file or not?
File.file?(fname)

File::directory?('dir_path') #bool

File.readable?(fname)
File.writable?(fname)
File.executable?(fname)

#checks for zero file size
File.zero?(fname)

#For finding type of file
File::ftype(fname) #returns 'file' or directory,characterSpl, blockSpl, fifo, link, socket, unknown

File::ctime(fname)
File::mtime(fname)
File::atime(fname)

Dir.chdir('path')
Dir.pwd

Dir.entries('path') #returns array of contents of each dir
Dir.foreach('path') do |entry|
#do something with entry

end

Dir['path/*'] #returns array of contents

Dir.mkdir('dir_name', perm-mask)


require 'tmpdir'
tempfilename = File.join(Dir.tmpdir, 'tingtong')
tempfile = File.new(tempfilename, 'w')
tempfile.puts 'Something'
tempfile.close

File.delete(tempfilename)

#same as:

require 'tempfile'
f = Tempfile.new('tingtong')
f.puts 'Hello'
puts f.path
f.close



#raise

raise 

#OR

raise "Error Message" 

#OR

raise ExceptionType, "Error Message"

#OR

raise ExceptionType, "Error Message" condition

#rescue is called as soon as raise occurs

begin  
   raise 'A test exception.'  
rescue Exception => e  
   puts e.message  
   puts e.backtrace.inspect  
end  


#throw-catch

throw :labelname condition

#this will not be executes

catch :labelname do

#this will be done


end


#Class exception
