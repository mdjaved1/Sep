require 'benchmark'
require_relative 'node'
require_relative 'linked_list'
 

array = []
list = LinkedList.new


puts Benchmark.measure {
    array << [1..10000]
}

puts  Benchmark.measure {
    (1..10000).each do |ele|
        list.add_to_front(Node.new(ele))
    end
}

puts Benchmark.measure {
    array[5000]
    
}

puts Benchmark.measure {
    node = list.head
      if node != 5000
         node = node.next  
      end
      node
}
puts Benchmark.measure {
  array.delete_at(5000)
}

puts Benchmark.measure{
    node = list.head
    if node != 5000
        node = node.next
    end
    list.delete(node)
}
