def space_written_ruby(*arrays)
   combined_array = arrays.flatten!
   quicksort(combined_array)
end 

def quicksort(array)
    
  return nil if array.empty?
    
  pivot = array.delete_at(rand(array.size))
    left, right = array.partition {|x| pivot > x}
  
    return *quicksort(left), pivot, *quicksort(right)
end

