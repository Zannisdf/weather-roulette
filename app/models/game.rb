class Game < ApplicationRecord
  include Picker
  before_save :set_result
  after_create :new_round
  has_many :bets
  has_many :players, through: :bets

  def set_result
    self.result = pick_one(green: 2, red: 49, black: 49)
  end

  def new_round
    Player.place_bets(self)
  end

  enum result: %i[green red black]
end
