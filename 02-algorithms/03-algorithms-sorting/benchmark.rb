require 'benchmark'
require_relative 'heap-sort'
require_relative 'quick-sort'
require_relative 'bucket-sort'



array = [1,3,2,8,4,9,100,55,88,44,46,87,99,67]
    


puts Benchmark.measure {  heap_sort(array) }
puts Benchmark.measure {  quicksort(array) }
puts Benchmark.measure {  bucket_sort(array) }


