class Bet < ApplicationRecord
  belongs_to :player
  belongs_to :game

  after_create :handle_payments

  def handle_payments
    paying_odds = { green: 15, red: 2, black: 2 }
    factor = choice == game.result ? paying_odds[choice.to_sym] : 0
    update_player_wallet(factor)
  end

  def update_player_wallet(factor)
    player.update(wallet: player.wallet + amount * (factor - 1))
  end

  enum choice: %i[green red black]
end
