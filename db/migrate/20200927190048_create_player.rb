class CreatePlayer < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :player
      t.string :team
      t.string :position
      t.integer :attempts
      t.decimal :attempts_per_game
      t.integer :yds
      t.decimal :avg
      t.decimal :yards_per_game
      t.integer :touchdowns
      t.string :longest_rush
      t.string :first_rush_downs
      t.decimal :first_rush_down_percentage
      t.integer :rushing_20_yards
      t.integer :rushing_40_yards
      t.integer :fumbles
      t.timestamps :null => true
    end
  end
end
