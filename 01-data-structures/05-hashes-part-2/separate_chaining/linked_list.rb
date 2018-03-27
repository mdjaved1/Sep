require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head == nil && @tail == nil 
      @head = node 
      @tail = @head
    else
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
   node = @head 
   if @head == @tail 
     @head = nil 
     @tail = nil 
   else 
     while node != nil && node.next !=@tail
       node = node.next 
     end
     @tail = node 
     @tail.next = nil 
   end
  end

  # This method prints out a representation of the list.
  def print
        
    node = @head 
    while node != nil 
      puts "#{node.data}"
      node = node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    n = @head 
    if node == @head 
      @head = node.next  
    elsif node == @tail 
     remove_tail
   else 
      while  n.next != node
        n = n.next
      end
      n.next = n.next.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head == nil && @tail == nil 
      @head = node 
      @tail = @head 
    else 
      n = @head 
      @head = node 
      @head.next = n 
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head == @tail
       @head = nil 
       @tail = nil 
    else
       @head = @head.next 
    end
  end
end