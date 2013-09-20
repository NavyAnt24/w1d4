def range(start,finish)
  if start == finish
    return [start]
  else
    return ([start] + range(start+1,finish))
  end
end

def recursive_sum(arr)
  if arr.length == 1
    return arr[0]
  else
    return arr[0] + recursive_sum(arr[1..-1])
  end
end

def iterative_sum(arr)
  sum = 0
  arr.each do |number|
    sum += number
  end
  sum
end

array = [1,2,3,4,5]

p recursive_sum(array)
p array