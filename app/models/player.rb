class Player < ApplicationRecord
  include Picker

  has_many :bets
  has_many :games, through: :bets
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :wallet, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.place_bets(game)
    all.each do |player|
      Bet.create(
        player: player,
        game: game,
        amount: player.bet_amount,
        choice: player.pick_one(green: 2, red: 49, black: 49)
      )
    end
  end

  def bet_amount
    wallet <= 1000 ? wallet : (wallet * rand(bet_range)).to_i
  end

  def bet_range
    0.08..0.15
  end
end
