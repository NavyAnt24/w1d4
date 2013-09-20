def mutable?(object)
  if object.is_a?(Fixnum)
    return false
  elsif object.is_a?(TrueClass)
    return false
  elsif object.is_a?(FalseClass)
    return false
  elsif object.is_a?(NilClass)
    return false
  else
    return true
  end
end

class Array
  def test
    p square(5)
  end

  def deep_dup
    duped_array = []
    self.each do |elem|
      if elem.instance_of?(Array)
        duped_array << elem.deep_dup
      elsif mutable?(elem)
        duped_array << elem.dup
      else
        duped_array << elem
      end
    end
    duped_array
  end
end

x = [[1,2,3],[4,5,6]]
y = x.deep_dup
z = x.dup

y[0]<< 7
p x
z[0] << 7
p x