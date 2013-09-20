def fib_recurse(n)
  return [1] if n == 1
  return [1,1] if n == 2

  prev_array = fib_recurse(n-1)
  prev_array << prev_array[-1] + prev_array[-2]
  prev_array
end

def fib_iterative(n)
  fib = []
  fib << 1 if n >= 1
  fib << 1 if n >= 2

  (n-2).times do
    fib << fib[-1] + fib[-2]
  end
  fib
end

p fib_recurse(15)
p fib_iterative(15)
p fib_iterative(1)
p fib_iterative(2)
p fib_iterative(3)