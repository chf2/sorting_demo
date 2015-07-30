def bubble_sort!(arr)
  len = arr.length - 1
  sorted = false

  until sorted
    sorted = true
    (0...len).each do |idx|
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        sorted = false
      end
    end
  end

  arr
end

def bubble_sort(arr)
  bubble_sort!(arr.dup)
end

def quicksort(arr) 
  return arr if arr.length <= 1
  left, right = [], []
  pivot = arr.first
  arr.drop(1).each do |el|
    if el <= pivot
      left << el
    else
      right << el
    end
  end
  
  quicksort(left) + [pivot] + quicksort(right)
end

def random_arr(n)
  Array.new(n) { rand(n) }
end

def performance_test(size, count)
  bubble_time = 0
  quick_time = 0
  count.times do 
    arr_to_test = random_arr(size)
    
    start_time = Time.now
    bubble_sort(arr_to_test)
    bubble_time += Time.now - start_time

    
  end

  avg_bubble, avg_quick = bubble_time / count, quick_time / count
  puts "For #{size} elements:"
  puts "On average, bubble sort took #{avg_bubble.round(4)} seconds."
  puts "On average, quick sort took #{avg_quick.round(4)} seconds.\n"
end

def get_quick_time(arr_to_test)
  start_time = Time.now
  quicksort(arr_to_test)
  Time.now - start_time

performance_test(10, 3)
performance_test(100, 3)
performance_test(1000, 3)
performance_test(10000, 3)
performance_test(100000, 3)
