class Player < ApplicationRecord
  has_many :bets
  has_many :games, through: :bets
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :wallet, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
