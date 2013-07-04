class AddIdealPpgToTeamSettings < ActiveRecord::Migration
  def change
    add_column :team_settings, :qb_points, :integer
    add_column :team_settings, :rb1_points, :integer
    add_column :team_settings, :rb2_points, :integer
    add_column :team_settings, :wr1_points, :integer
    add_column :team_settings, :wr2_points, :integer
    add_column :team_settings, :flex_points, :integer
    add_column :team_settings, :te_points, :integer
    add_column :team_settings, :k_points, :integer
    add_column :team_settings, :dst_points, :integer
    add_column :team_settings, :total_points, :integer
  end
end
