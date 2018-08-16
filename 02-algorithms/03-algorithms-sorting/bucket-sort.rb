def bucket_sort(array, bucket_size = array.length - 2)
    buckets = Array.new(bucket_size){[]}
    max = array.max
    divider = ((max + 1) / bucket_size).ceil
    array.each do |ele|
        j = (ele/ divider)
        if buckets[j] == nil; 
            buckets[j] = ele
        else
            buckets[j] << ele
        end
    end
    buckets.map! do |ele| 
       insertion_sort(ele)
    end
    return buckets.flatten.compact
end
 

 def insertion_sort(collection)
   
   sorted_collection = [collection.delete_at(0)]

   for val in collection
     sorted_collection_index = 0
     
     while sorted_collection_index < sorted_collection.length
       if val <= sorted_collection[sorted_collection_index]
         
         sorted_collection.insert(sorted_collection_index, val)
         break
       elsif sorted_collection_index == sorted_collection.length - 1
         sorted_collection.insert(sorted_collection_index + 1, val)
         break
       end

       sorted_collection_index += 1
     end
   end

   sorted_collection
 end