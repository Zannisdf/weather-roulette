class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.references :player, foreign_key: true
      t.references :game, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
