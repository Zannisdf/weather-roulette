module Picker
  def pick_one(odds)
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