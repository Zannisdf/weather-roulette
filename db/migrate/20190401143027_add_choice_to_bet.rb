class AddChoiceToBet < ActiveRecord::Migration[5.2]
  def change
    add_column :bets, :choice, :integer
  end
end
