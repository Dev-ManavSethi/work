class Customer
   @@no_of_customers = 0
   def initialize(id, name, addr)
      @cust_id = id
      @cust_name = name
      @cust_addr = addr
   end
end

class Box
@@count = 0

  def initialize(w,h)
      @width, @height = w, h
  end

 def printWidth
      @width
   end

 def printHeight
      @height
   end

 def setWidth=(value)
      @width = value
   end
 def setHeight=(value)
      @height = value
   end

 def self.printCount()
      puts "Box count is : #@@count"
   end


def to_json
"{w:#{@width},h:#{@height}}"
end

def to_s

"w: #{@height}, h: #{@width}"

end

protected

def getHeight
  return @height
  end

  def getWidth
  return @width

  end



def getArea
      @width * @height
   end



end
