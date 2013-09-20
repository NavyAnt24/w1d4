def my_func(*args)
  if !block_given?
    puts "no block given"
  else
    yield args
  end
end

my_func(1,2,3){|x| p x}