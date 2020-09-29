class AddPlayerPlayerIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :players, :player, :unique => true
  end
end
