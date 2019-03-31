class Game < ApplicationRecord
  include Picker
  before_save :set_result
  has_many :bets
  has_many :players, through: :bets

  def set_result
    self.result = pick_one(green: 2, red: 49, black: 49)
  end

  enum result: %i[green red black]
end
