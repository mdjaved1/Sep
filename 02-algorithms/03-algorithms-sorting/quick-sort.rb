def quicksort(array)
    
  return nil if array.empty?
    
  pivot = array.delete_at(rand(array.size))
    left, right = array.partition {|x| pivot > x}
  
    return *quicksort(left), pivot, *quicksort(right)
end

