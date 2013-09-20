def exp(base, exponent)
  return 1 if exponent == 0
  return base * exp(base, exponent - 1)
end

def exp_faster(base, exponent)
  return 1 if exponent == 0
  if exponent.even?
    result = exp_faster(base, exponent / 2)
    return result * result
  else
    result = exp_faster(base, (exponent - 1) / 2)
    return base * result * result
  end
end

p 3 ** 6
p exp(3, 6)
p exp_faster(3, 6)