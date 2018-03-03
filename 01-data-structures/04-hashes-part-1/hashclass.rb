require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key,size) 
    newhash = HashItem.new(key,value)
    if @items[i] == nil 
      @items[i] = newhash
    elsif @items[i].key != newhash.key 
      self.resize
      self[key] = value 
    elsif @items[i].value != newhash.value 
      self.resize
      @items[index(newhash.key, size)] = value 
    end
  end


  def [](key)
    i = index(key,size)
    @items[i].value
  end

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

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end