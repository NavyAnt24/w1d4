def make_change(total, coins = [25, 10, 5, 1])

  #return [] if coins == [] && total == 0

  if coins.length == 1
    return nil unless total % coins[0] == 0
    return [coins[0]]*(total/coins[0])
  end

  to_compare = []
  coins_used = 0
  while total >= coins[0] * coins_used
    #p ([coins[0]]*coins_used)+ make_change(remaining, coins[1..-1])
    change = make_change(total - (coins[0] * coins_used), coins[1..-1])
    if change.nil?
      to_compare << nil
    else
      to_compare << ([coins[0]]*coins_used) + change
    end
    coins_used += 1
  end

  to_compare.delete(nil)

  return nil if to_compare.empty?

  to_compare_sorted = to_compare.sort do |coin_config1,coin_config2|
    coin_config1.length <=> coin_config2.length
  end

  return to_compare_sorted.first #returns min
end


p make_change(39)
p make_change(14,[10,5,1])
p make_change(14, [10, 7, 1])
p make_change(15, [10, 6, 2])