# Pick one option considering its weight.
module Picker
  def pick_one(odds = { green: 2, red: 49, black: 49 })
    total_odds = odds.values.sum
    picked = rand(0...total_odds)
    current_value = 0
    odds.each do |bet, odd|
      current_value += odd
      return bet if picked < current_value
    end
    nil
  end
end