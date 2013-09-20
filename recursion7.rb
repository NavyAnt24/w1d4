def subsets(array)
  return [[]] if array.empty?
  without = subsets(array[1..-1])
  with = without.map { |subset| subset.dup << array[0] }
  without + with
end

p subsets((1..3).to_a)