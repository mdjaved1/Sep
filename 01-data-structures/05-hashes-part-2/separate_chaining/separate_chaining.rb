require_relative 'linked_list'


class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @count =  0 
  end

  def []=(key, value)
    newnode = Node.new(key, value)
    i = index(key,size)
    if @items[i] == nil 
      @items[i] = LinkedList.new
      @items[i].add_to_front(newnode)
      @count += 1
    else
      current = @items[i].head
      until current == nil || current.key == key
        current = current.next
      end
      if current == nil
        @items[i].add_to_front(newnode)
        @count += 1
      elsif current.key == key && current.value != value
        current.value = value 
      end
    end
    if load_factor > @max_load_factor
      resize
    end
  end

  def [](key)

    i = index(key, size)
    if @items[i]
      h = @items[i].head
      while h != nil 
        if h.key == key
          return h.value
        else
          h = h.next 
        end
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
  @count 
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
      if @items[ele] != nil 
        n = @items[ele].head
        until n == nil 
          newi = n.key.sum % arr.length
          arr[newi] = LinkedList.new
          arr[newi].add_to_front(n)
          n = n.next
        end
      @items[ele] = nil 
      end
    end
    @items = arr
  end
end
