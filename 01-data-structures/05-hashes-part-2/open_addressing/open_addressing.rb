require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  
  end

  def []=(key, value)
    i = index(key,size)
    if @items[i] == nil 
      @items[i] = Node.new(key, value)
    elsif @items[i].key == key && @items[i].value != value 
      @items[i].value = value
    else
      opp = next_open_index(i)
      if opp == -1  
        puts "Resizing self..."
        self.resize
        self[key] = value
        puts "Resized self to " + @items.length.to_s
      end
    end
  end

  def [](key)
    i = index(key,size)
    if  @items[i].key == key
      return @items[i].value 
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size 
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
     arr  =  index..@items.length
     arr.each do |ele|
       if @items[ele] == nil 
         return  ele 
       else
         return -1 
       end
     end
  end
  

  # Simple method to return the number of items in the hash
  def size
    @items.length 
  end

  # Resize the hash
  def resize
    arr = Array.new(size * 2)
    iter = 0..@items.length
    iter.each do |ele|
      if @items[ele]
        inew = @items[ele].key.sum % arr.length
        arr[inew] = @items[ele]
      end
    end
    @items = arr
  end
end