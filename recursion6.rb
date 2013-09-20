def make_change(total, coins = [25, 10, 5, 1])
  combinations = []

  if coins.length == 1
    if total % coins[0] != 0
      return nil  #could not make change
    else
      return [coins[0]] * (total / coins[0])
    end
  end

  remaining_money = total
  coins_used = 0
  combinations << make_change(total, coins[1..-1])
  best_index = 0
  best_value = combinations[0].length

  while remaining_money > coins.first
    coins_used += 1
    remaining_money -= coins.first
    change_made = make_change(remaining_money, coins[1..-1])
    ####
    if change_made != nil
      combinations << change_made
      if combinations.last.length + coins_used < best_value
        best_index = coins_used
        best_value = combinations.last.length + coins_used
      end
    end
  end

  ([coins[0]] * best_index) + combinations[best_index]
end


p make_change(39)
p make_change(14, [10, 7, 1])
p make_change(15, [10, 6, 2])