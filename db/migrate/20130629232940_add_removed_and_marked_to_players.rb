class AddRemovedAndMarkedToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :removed, :boolean, :default => false
    add_column :players, :marked, :boolean, :default => false
  end
end
