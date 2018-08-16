require 'benchmark'
require_relative 'heap-sort'
require_relative 'quick-sort'
require_relative 'bucket-sort'



array1 = Array.new(1000){rand 2.1000}

puts Benchmark.measure {  heap_sort(array1) }
puts Benchmark.measure {  quicksort(array1) }
puts Benchmark.measure {  bucket_sort(array1) }


 #Quick Sort is the fastest way to sort things , bucket sort will take too much time as there will be buckts that you are running insertion sort on !. 