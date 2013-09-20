class Array
  def my_each
    0.upto(self.length-1) do |index|
      yield(self[index])
    end
  end

  def my_map
    modified_array = []
    self.my_each do |element|
      modified_array << yield(element)
    end
    modified_array
  end

  def my_map_with_proc(&proc)
    modified_array = []
    self.my_each do |element|
      modified_array << proc.call(element)
    end
    modified_array
  end


  def my_select
    modified_array = []
    self.my_each do |element|
      modified_array << element if yield(element)
    end
    modified_array
  end

  def my_inject
    accumulator = self.first
    return accumulator if self.length == 1
    1.upto(self.length-1) do |index|
      accumulator = yield(accumulator, self[index])
    end
    accumulator
  end

  def my_sort!
    sorted = false
    until sorted
      sorted = true
      0.upto(self.length-2) do |index|
        if yield(self[index], self[index+1]) == 1
          sorted = false
          self[index], self[index+1] = self[index+1], self[index]
        end
      end
    end
  end
end

test = [0,3,5,6,2]

test.my_each do |n|
  p n
end

p "------"

temp = test.my_map do |n|
  n * n
end

p temp

p "------"

temp = test.my_select do |n|
  n % 2 == 0
end

p temp

p "------"

temp = test.my_inject { |sum, n| sum + n }

p temp

test = [3,5,10,2,1,20,3,0]

test.my_sort! { |num1, num2| num2 <=> num1 }

p test