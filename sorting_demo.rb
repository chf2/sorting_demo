require 'io/console'

class SortingDemo
  # Bubble Sort: O(n^2)
  def self.bubble_sort!(array)
    len = array.length - 1
    sorted = false

    until sorted
      sorted = true
      (0...len).each do |idx|
        if array[idx] > array[idx + 1]
          array[idx], array[idx + 1] = array[idx + 1], array[idx]
          sorted = false
        end
      end
    end

    array
  end

  def self.bubble_sort(array)
    bubble_sort!(array.dup)
  end

  # Merge Sort: O(n*lg(n))
  def self.merge_sort (array, &prc)
    return array if array.length <= 1

    mid_idx = array.length / 2
    merge(
      merge_sort(array.take(mid_idx), &prc),
      merge_sort(array.drop(mid_idx), &prc),
      &prc
    )
  end

  # NB: In Ruby, shift is an O(1) operation. This is not true of all languages.
  def self.merge(left, right, &prc)
    merged_array = []
    prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
    end

    merged_array + left + right
  end

  def self.performance_test(size, count)
    arrays_to_test = []
    count.times do 
      arrays_to_test << random_arr(size)
    end

    print "\nPress any key to run Merge Sort for #{size} elements: "
    STDIN.getch
    run_merge_sort(arrays_to_test)

    print "Press any key to run Bubble Sort for #{size} elements: "
    STDIN.getch
    run_bubble_sort(arrays_to_test)
  end

  def self.random_arr(n)
    Array.new(n) { rand(n) }
  end

  def self.run_bubble_sort(arrays)
    bubble_time = 0
    arrays.each do |array|
      array_to_test = array.dup
      start_time = Time.now
      bubble_sort(array_to_test)
      bubble_time += Time.now - start_time
    end
    avg_bubble = bubble_time / arrays.length 
    puts "\nOn average, Bubble Sort took #{avg_bubble.round(4)} seconds.\n\n"
  end

  def self.run_merge_sort(arrays)
    merge_time = 0
    arrays.each do |array|
      array_to_test = array.dup
      start_time = Time.now
      merge_sort(array_to_test)
      merge_time += Time.now - start_time
    end
    avg_merge = merge_time / arrays.length
    puts "\nOn average, Merge Sort took #{avg_merge.round(4)} seconds."
  end

  def self.run_performance_tests(multiplier = 5, rounds = 3)
    [1, 10, 100, 1000, 10000].each do |size|
      size *= multiplier
      print "Running test for #{size} elements:"
      performance_test(size, rounds)
    end
  end
end

SortingDemo.run_performance_tests