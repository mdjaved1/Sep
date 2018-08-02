def binary_recur(collection, value)
    low  = 0 
    high = collection.length - 1 
    while low <= high 
    mid = high / 2
      if collection[mid] == value 
        return value
      elsif collection[mid] < value 
        return binary_recur(collection[(mid+1..high)], value)
      else
          binary_recur(collection[low..mid], value)
      end
    end
end