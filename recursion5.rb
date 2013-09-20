def bsearch(array, target)
  pivot = (array.length - 1) / 2
  value_at_pivot = array[pivot]
  return true if value_at_pivot == target
  return false if array.length == 1
  if target < value_at_pivot
    return bsearch(array[0...pivot], target)
  else
    return bsearch(array[pivot+1..-1], target)
  end
end

p bsearch((1..10).to_a, 9)
p bsearch((1..10).to_a, 11)
p bsearch([1, 2, 3, 4, 6, 7, 8], 5)
