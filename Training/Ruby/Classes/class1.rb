fred = Class.new do
  def meth1
    "hello"
  end
  def meth2
    "bye"
  end
end

a = fred.new
a.meth1
a.meth2     

json_creatable?() #to convert json str to object, def json_create in class with hash as first param


Classname.superclass #gives superclass name or nil

#private instance method

class Foo
  def self.inherited(subclass)
    puts "New subclass: #{subclass}"
  end
end

class Bar < Foo
end

class Baz < Bar
end


 
