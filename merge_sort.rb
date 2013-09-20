class Array
  def merge_sort(&comparison_function)
    return self if self.length == 1
    pivot = (self.length) / 2
    first_half = self[0...pivot].merge_sort(&comparison_function)
    second_half = self[pivot..-1].merge_sort(&comparison_function)

    merge(first_half,second_half,&comparison_function)
  end

  #----- Helper Function

  def merge(first_half,second_half)
    merged = []

    while first_half.length + second_half.length > 0
      if first_half.empty?
        merged << second_half.shift
      elsif second_half.empty?
        merged << first_half.shift
      elsif yield(first_half.first, second_half.first) == -1
        merged << first_half.shift
      else
        merged << second_half.shift
      end
    end

    merged
  end
end

test_array = (1..25).to_a.shuffle

temp = test_array.merge_sort do |x,y|
  z = 0
  if x.even? and not y.even?
    z=-1
  elsif y.even? and not x.even?
    z=1
  else
    z=(x <=> y)
  end
  z
end

p temp