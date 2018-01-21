class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    
   @stack.unshift(item)
   self.top = @stack.first
  end

  def pop
    newItem = self.top
    @stack.delete(self.top)
    self.top = @stack.last
    newItem
  end

  def empty?
    @stack.empty?
  end
end