class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.integer :wallet, default: 10_000

      t.timestamps
    end
  end
end
