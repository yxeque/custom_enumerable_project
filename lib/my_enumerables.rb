module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    selected = []

    each do |element|
      if yield(element)
        selected.push(element)
      end
    end
    selected
  end

  def my_all?
    each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    each do |element|
      return true if yield(element)
    end
    false
  end

  def my_none?
    each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count
    count = 0
    if block_given?
      each do |element|
        count += 1 if yield(element)
      end
    else
      count = size
    end
    count
  end

  def my_map
    new_arr = []
    each do |element|
      new_arr << yield(element)
    end
    new_arr
  end

  def my_inject(initial = nil)
    accumulator = initial
    each do |element|
      accumulator = yield(accumulator, element) if accumulator
      accumulator ||= element unless accumulator
    end
    accumulator
  end
end
