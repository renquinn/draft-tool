class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :team

      t.string :name
      t.string :nfl_team
      t.string :position

      t.integer :completions
      t.integer :attempts
      t.integer :passing_yards
      t.integer :passing_touchdowns
      t.integer :interceptions

      t.integer :rushes
      t.integer :rushing_yards
      t.integer :rushing_touchdowns

      t.integer :receptions
      t.integer :receiving_yards
      t.integer :receiving_touchdowns

      t.timestamps
    end
  end
end
