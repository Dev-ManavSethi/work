

#Ruby is a OO lang
#Go isn't

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

#here error could happen
rescue TypeOfError

rescue TypeOfErr2 => var

#do anything with var


retry #restart from begin

end


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

#hash 


function_name 1,2 #return array if no. of values more than 1

map = {

"Manav" => "Software Dev",
"Age" => 24,
12 => "Twelve"

}

puts
puts
puts

puts map
puts map["Age"]


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
