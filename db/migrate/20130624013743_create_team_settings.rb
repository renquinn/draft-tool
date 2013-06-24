class CreateTeamSettings < ActiveRecord::Migration
  def change
    create_table :team_settings do |t|
      t.references :team

      t.float :completions
      t.float :attempts
      t.float :passing_yards
      t.float :passing_touchdowns
      t.float :interceptions

      t.float :rushes
      t.float :rushing_yards
      t.float :rushing_touchdowns

      t.float :receptions
      t.float :receiving_yards
      t.float :receiving_touchdowns

      t.timestamps
    end
    add_index :team_settings, :team_id
  end
end
